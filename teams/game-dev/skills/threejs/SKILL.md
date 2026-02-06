---
name: threejs
description: Three.js and React Three Fiber patterns, scene graph management, disposal, and TypeScript conventions
---

# Three.js / React Three Fiber Development Skill

## Engine Detection
Look for: `package.json` with `three`, `@react-three/fiber`, `@react-three/drei`, `.glb`, `.gltf`, `.hdr`

## Project Structure (Vanilla Three.js)
```
src/
  main.ts              # Entry point, renderer setup
  scene/
    SceneManager.ts    # Scene lifecycle
    LevelLoader.ts
  entities/
    Player.ts
    Enemy.ts
  systems/
    InputSystem.ts
    PhysicsSystem.ts
    AudioSystem.ts
  rendering/
    MaterialLibrary.ts
    PostProcessing.ts
    ShaderChunks/
  utils/
    ObjectPool.ts
    MathUtils.ts
  types/
    GameTypes.ts
public/
  models/
  textures/
  audio/
```

## Project Structure (React Three Fiber)
```
src/
  App.tsx
  components/
    canvas/
      GameCanvas.tsx     # Canvas + providers
      Scene.tsx          # Main scene composition
    entities/
      Player.tsx
      Enemy.tsx
    environment/
      Terrain.tsx
      Skybox.tsx
      Lighting.tsx
    ui/
      HUD.tsx
      MainMenu.tsx
    effects/
      PostProcessing.tsx
      Particles.tsx
  hooks/
    useGameLoop.ts
    useInput.ts
    usePhysics.ts
  stores/
    gameStore.ts         # Zustand store
  types/
    game.ts
  utils/
    pool.ts
public/
  models/
  textures/
```

## Scene Graph & Disposal

Proper resource management is critical. Three.js does NOT garbage collect GPU resources:

```typescript
// Creating resources
const geometry = new THREE.BoxGeometry(1, 1, 1);
const material = new THREE.MeshStandardMaterial({ color: 0xff0000 });
const mesh = new THREE.Mesh(geometry, material);
scene.add(mesh);

// MUST dispose when removing
scene.remove(mesh);
geometry.dispose();
material.dispose();
if (material.map) material.map.dispose();
// Dispose ALL textures: map, normalMap, roughnessMap, etc.

// Helper for deep disposal
function disposeObject(obj: THREE.Object3D): void {
  obj.traverse((child) => {
    if (child instanceof THREE.Mesh) {
      child.geometry.dispose();
      if (Array.isArray(child.material)) {
        child.material.forEach(disposeMaterial);
      } else {
        disposeMaterial(child.material);
      }
    }
  });
  obj.removeFromParent();
}

function disposeMaterial(mat: THREE.Material): void {
  for (const value of Object.values(mat)) {
    if (value instanceof THREE.Texture) {
      value.dispose();
    }
  }
  mat.dispose();
}
```

## Game Loop (Vanilla Three.js)

```typescript
class Game {
  private renderer: THREE.WebGLRenderer;
  private scene: THREE.Scene;
  private camera: THREE.PerspectiveCamera;
  private clock = new THREE.Clock();
  private systems: GameSystem[] = [];

  constructor(canvas: HTMLCanvasElement) {
    this.renderer = new THREE.WebGLRenderer({ canvas, antialias: true });
    this.renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
    this.renderer.setSize(window.innerWidth, window.innerHeight);

    this.scene = new THREE.Scene();
    this.camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);

    window.addEventListener('resize', this.onResize);
    this.animate();
  }

  private animate = (): void => {
    requestAnimationFrame(this.animate);
    const delta = this.clock.getDelta();
    const elapsed = this.clock.getElapsedTime();

    for (const system of this.systems) {
      system.update(delta, elapsed);
    }

    this.renderer.render(this.scene, this.camera);
  };

  private onResize = (): void => {
    this.camera.aspect = window.innerWidth / window.innerHeight;
    this.camera.updateProjectionMatrix();
    this.renderer.setSize(window.innerWidth, window.innerHeight);
  };

  dispose(): void {
    window.removeEventListener('resize', this.onResize);
    this.renderer.dispose();
    // Dispose all scene objects
    disposeObject(this.scene);
  }
}
```

## React Three Fiber Patterns

```tsx
// GameCanvas.tsx - Entry point
import { Canvas } from '@react-three/fiber';
import { Physics } from '@react-three/rapier';

export function GameCanvas() {
  return (
    <Canvas
      camera={{ position: [0, 5, 10], fov: 60 }}
      shadows
      gl={{ antialias: true }}
    >
      <Physics>
        <Scene />
      </Physics>
    </Canvas>
  );
}
```

```tsx
// Player.tsx - Entity component
import { useFrame } from '@react-three/fiber';
import { useRef } from 'react';
import { useInput } from '../hooks/useInput';

export function Player() {
  const meshRef = useRef<THREE.Mesh>(null!);
  const input = useInput();

  useFrame((state, delta) => {
    // Runs every frame inside the render loop
    meshRef.current.position.x += input.horizontal * 5 * delta;
    meshRef.current.position.z += input.vertical * 5 * delta;
  });

  return (
    <mesh ref={meshRef} castShadow>
      <boxGeometry args={[1, 2, 1]} />
      <meshStandardMaterial color="blue" />
    </mesh>
  );
}
```

## Zustand for Game State

```typescript
// gameStore.ts
import { create } from 'zustand';

interface GameState {
  health: number;
  score: number;
  isPaused: boolean;
  takeDamage: (amount: number) => void;
  addScore: (points: number) => void;
  togglePause: () => void;
}

export const useGameStore = create<GameState>((set) => ({
  health: 100,
  score: 0,
  isPaused: false,
  takeDamage: (amount) =>
    set((state) => ({ health: Math.max(0, state.health - amount) })),
  addScore: (points) =>
    set((state) => ({ score: state.score + points })),
  togglePause: () =>
    set((state) => ({ isPaused: !state.isPaused })),
}));
```

## Object Pooling

```typescript
class ObjectPool<T extends THREE.Object3D> {
  private available: T[] = [];
  private active = new Set<T>();

  constructor(
    private factory: () => T,
    initialSize: number,
  ) {
    for (let i = 0; i < initialSize; i++) {
      this.available.push(factory());
    }
  }

  acquire(): T {
    const obj = this.available.pop() ?? this.factory();
    obj.visible = true;
    this.active.add(obj);
    return obj;
  }

  release(obj: T): void {
    obj.visible = false;
    this.active.delete(obj);
    this.available.push(obj);
  }

  get activeCount(): number {
    return this.active.size;
  }
}
```

## Performance Optimization

```typescript
// Use instancing for many identical objects
const instancedMesh = new THREE.InstancedMesh(geometry, material, count);
const matrix = new THREE.Matrix4();
for (let i = 0; i < count; i++) {
  matrix.setPosition(positions[i]);
  instancedMesh.setMatrixAt(i, matrix);
}
instancedMesh.instanceMatrix.needsUpdate = true;

// LOD (Level of Detail)
const lod = new THREE.LOD();
lod.addLevel(highDetailMesh, 0);     // 0-50 units
lod.addLevel(mediumDetailMesh, 50);  // 50-150 units
lod.addLevel(lowDetailMesh, 150);    // 150+ units

// Texture optimization
const loader = new THREE.TextureLoader();
const texture = loader.load('texture.jpg');
texture.minFilter = THREE.LinearMipMapLinearFilter;
texture.generateMipmaps = true;
texture.anisotropy = renderer.capabilities.getMaxAnisotropy();
```

## Key Rules

1. **Always dispose GPU resources** - geometry, material, texture, render targets
2. **Use delta time in useFrame/animate** - Frame-rate independent updates
3. **Limit pixel ratio** - `Math.min(window.devicePixelRatio, 2)` prevents GPU overload
4. **Use instancing for repeated geometry** - Massively reduces draw calls
5. **Remove event listeners on cleanup** - Prevent memory leaks
6. **Use refs for Three.js objects in R3F** - Not React state
7. **Keep React state out of the render loop** - Use Zustand or refs for per-frame data
8. **Use drei helpers** - OrbitControls, Environment, useGLTF, etc.
9. **Compress textures** - KTX2/Basis Universal for GPU compression
10. **Profile with Stats.js and renderer.info** - Monitor draw calls, triangles, textures

## Common Anti-Patterns

- Creating new materials/geometries every frame
- Using `setState` inside `useFrame` - causes React re-renders
- Not disposing loaded GLTF models when removed
- Using `THREE.Group` parent without disposing children
- Large textures without power-of-2 dimensions or compression
