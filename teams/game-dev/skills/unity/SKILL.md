---
name: unity
description: Unity game engine patterns, lifecycle, best practices, and C# conventions
---

# Unity Development Skill

## Engine Detection
Look for: `.csproj`, `.sln`, `.unity`, `.prefab`, `.asmdef`, `ProjectSettings/`, `Assets/`, `Packages/manifest.json`

## Project Structure
```
Assets/
  Scripts/
    Player/
    Enemies/
    UI/
    Systems/
    Utilities/
  Prefabs/
  Scenes/
  Materials/
  Textures/
  Audio/
  Animations/
  ScriptableObjects/
  Editor/           # Editor-only scripts
  Plugins/          # Third-party plugins
Packages/
ProjectSettings/
```

## MonoBehaviour Lifecycle

Order of execution matters. Use the correct callback:

```csharp
public class GameEntity : MonoBehaviour
{
    // Called once when the script instance is loaded
    void Awake()
    {
        // Initialize self-references (GetComponent, etc.)
        // Do NOT reference other objects here - they may not be ready
    }

    // Called once before the first Update, after all Awake calls
    void Start()
    {
        // Safe to reference other objects
        // Initialize state that depends on other components
    }

    // Called every frame
    void Update()
    {
        // Input handling, non-physics movement
        // Use Time.deltaTime for frame-rate independence
    }

    // Called at fixed intervals (default 0.02s)
    void FixedUpdate()
    {
        // Physics-related code (Rigidbody movement, forces)
    }

    // Called after all Update calls
    void LateUpdate()
    {
        // Camera follow, UI updates that depend on game state
    }

    // Called when the object is destroyed
    void OnDestroy()
    {
        // Unsubscribe events, clean up resources
    }

    void OnEnable() { /* Subscribe to events */ }
    void OnDisable() { /* Unsubscribe from events */ }
}
```

## ScriptableObjects (Data-Driven Design)

Use ScriptableObjects for game data, configuration, and shared state:

```csharp
[CreateAssetMenu(fileName = "NewWeapon", menuName = "Game/Weapon Data")]
public class WeaponData : ScriptableObject
{
    public string weaponName;
    public int damage;
    public float attackSpeed;
    public float range;
    public GameObject projectilePrefab;
    public AudioClip attackSound;
}
```

Usage in components:
```csharp
public class WeaponController : MonoBehaviour
{
    [SerializeField] private WeaponData weaponData;

    public void Attack()
    {
        // Use weaponData.damage, weaponData.attackSpeed, etc.
    }
}
```

## Object Pooling

```csharp
public class ObjectPool<T> where T : MonoBehaviour
{
    private readonly Queue<T> pool = new();
    private readonly T prefab;
    private readonly Transform parent;

    public ObjectPool(T prefab, int initialSize, Transform parent = null)
    {
        this.prefab = prefab;
        this.parent = parent;
        for (int i = 0; i < initialSize; i++)
            pool.Enqueue(CreateInstance());
    }

    public T Get()
    {
        var obj = pool.Count > 0 ? pool.Dequeue() : CreateInstance();
        obj.gameObject.SetActive(true);
        return obj;
    }

    public void Return(T obj)
    {
        obj.gameObject.SetActive(false);
        pool.Enqueue(obj);
    }

    private T CreateInstance()
    {
        var obj = Object.Instantiate(prefab, parent);
        obj.gameObject.SetActive(false);
        return obj;
    }
}
```

## Event System

```csharp
// ScriptableObject-based event channel
[CreateAssetMenu(menuName = "Events/Game Event")]
public class GameEvent : ScriptableObject
{
    private readonly List<System.Action> listeners = new();

    public void Raise() => listeners.ForEach(l => l.Invoke());
    public void Register(System.Action listener) => listeners.Add(listener);
    public void Unregister(System.Action listener) => listeners.Remove(listener);
}
```

## Key Rules

1. **Never use Find/FindObjectOfType in Update** - Cache references in Awake/Start
2. **Use [SerializeField] over public fields** - Encapsulation with inspector access
3. **Use CompareTag() instead of == for tag comparison** - Avoids GC allocation
4. **Avoid string-based methods** - Prefer direct references over SendMessage/Invoke
5. **Use async/await or coroutines for async operations** - Never block the main thread
6. **Dispose resources in OnDestroy** - Unsubscribe events, stop coroutines, release resources
7. **Use Assembly Definitions (.asmdef)** - Improve compile times in large projects
8. **Use TextMeshPro over legacy UI Text** - Better performance and rendering
9. **Pool objects instead of Instantiate/Destroy** - Reduce GC pressure
10. **Use Addressables for asset loading** - Better memory management than Resources.Load

## Common Anti-Patterns

- `GetComponent<T>()` every frame - cache it
- `new List<T>()` in Update - allocates every frame
- `string + string` in hot paths - use StringBuilder
- `Camera.main` repeated calls - cache the reference
- Coroutines that never stop - always stop on disable/destroy

## DOTS/ECS (Performance-Critical Systems)

For systems needing maximum performance, consider Unity's Data-Oriented Technology Stack:
- Use IComponentData for pure data components
- Use ISystem or SystemBase for processing logic
- Leverage Burst compiler for SIMD optimization
- Use NativeContainers for thread-safe collections
- Only use DOTS where performance demands it - MonoBehaviour is fine for most gameplay
