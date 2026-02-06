---
name: unreal
description: Unreal Engine patterns, Actor/Component model, Blueprints vs C++, and best practices
---

# Unreal Engine Development Skill

## Engine Detection
Look for: `.uproject`, `.Build.cs`, `.uplugin`, `Source/`, `Content/`, `Config/DefaultEngine.ini`, `Binaries/`

## Project Structure
```
MyGame/
  Source/
    MyGame/
      Public/           # Headers (.h)
        Player/
        Enemies/
        UI/
        Systems/
      Private/          # Implementation (.cpp)
        Player/
        Enemies/
        UI/
        Systems/
      MyGame.Build.cs
      MyGame.h
  Content/
    Blueprints/
    Maps/
    Materials/
    Textures/
    Meshes/
    Audio/
    UI/
  Config/
    DefaultEngine.ini
    DefaultGame.ini
    DefaultInput.ini
  Plugins/
  MyGame.uproject
```

## Actor/Component Architecture

Unreal uses an Actor/Component model. Actors are placed in the world, Components add functionality:

```cpp
// Header - Public/Player/MyCharacter.h
UCLASS()
class MYGAME_API AMyCharacter : public ACharacter
{
    GENERATED_BODY()

public:
    AMyCharacter();

protected:
    virtual void BeginPlay() override;
    virtual void Tick(float DeltaTime) override;
    virtual void SetupPlayerInputComponent(UInputComponent* Input) override;
    virtual void EndPlay(const EEndPlayReason::Type EndPlayReason) override;

    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Stats")
    float MaxHealth = 100.f;

    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "Components")
    UHealthComponent* HealthComponent;

    UFUNCTION(BlueprintCallable, Category = "Combat")
    void TakeDamage(float Amount, AActor* DamageCauser);

private:
    UPROPERTY()
    float CurrentHealth;
};
```

```cpp
// Implementation - Private/Player/MyCharacter.cpp
AMyCharacter::AMyCharacter()
{
    PrimaryActorTick.bCanEverTick = true;
    HealthComponent = CreateDefaultSubobject<UHealthComponent>(TEXT("HealthComp"));
}

void AMyCharacter::BeginPlay()
{
    Super::BeginPlay();
    CurrentHealth = MaxHealth;
}
```

## UPROPERTY Specifiers

```cpp
// Editable in editor, readable/writable in Blueprints
UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Stats")
float Speed;

// Only visible in editor, read-only in Blueprints
UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = "Components")
USceneComponent* Root;

// Replicated for multiplayer
UPROPERTY(Replicated)
int32 Score;

// Replicated with notification
UPROPERTY(ReplicatedUsing = OnRep_Health)
float Health;
```

## Blueprints vs C++ Decision Guide

**Use C++ for**:
- Core gameplay systems and base classes
- Performance-critical code (AI, physics, networking)
- Complex algorithms and data structures
- Low-level engine interaction
- Systems other programmers will extend

**Use Blueprints for**:
- Level-specific scripting and sequences
- UI logic and widget behavior
- Quick prototyping and iteration
- Designer-tunable parameters
- Visual effects and animation triggers

**Best pattern**: C++ base class + Blueprint child class
```cpp
// C++ base with BlueprintNativeEvent
UFUNCTION(BlueprintNativeEvent, Category = "Combat")
void OnDeath();
void OnDeath_Implementation();  // Default C++ behavior, overridable in BP
```

## Gameplay Ability System (GAS)

For complex ability/effect systems:

```cpp
// Ability
UCLASS()
class UGA_FireBall : public UGameplayAbility
{
    GENERATED_BODY()
public:
    virtual void ActivateAbility(...) override;
    virtual void EndAbility(...) override;
    virtual bool CanActivateAbility(...) const override;
};

// Gameplay Effect for damage
UCLASS()
class UGE_FireDamage : public UGameplayEffect
{
    // Configure in editor: damage value, duration, tags
};
```

## Delegates & Events

```cpp
// Single-cast delegate
DECLARE_DELEGATE_OneParam(FOnHealthChanged, float);

// Multi-cast delegate (Blueprint compatible)
DECLARE_DYNAMIC_MULTICAST_DELEGATE_OneParam(FOnHealthChangedDynamic, float, NewHealth);

// Usage in class
UPROPERTY(BlueprintAssignable)
FOnHealthChangedDynamic OnHealthChanged;

// Broadcast
OnHealthChanged.Broadcast(CurrentHealth);
```

## Enhanced Input System

```cpp
void AMyCharacter::SetupPlayerInputComponent(UInputComponent* PlayerInput)
{
    auto* EIC = CastChecked<UEnhancedInputComponent>(PlayerInput);

    EIC->BindAction(MoveAction, ETriggerEvent::Triggered, this, &AMyCharacter::Move);
    EIC->BindAction(JumpAction, ETriggerEvent::Started, this, &AMyCharacter::StartJump);
}
```

## Key Rules

1. **Always use UPROPERTY for UObject pointers** - Prevents garbage collection of referenced objects
2. **Call Super:: on overridden functions** - BeginPlay, Tick, EndPlay all need Super calls
3. **Use GENERATED_BODY() in all UCLASS/USTRUCT** - Required for reflection
4. **Use soft references for large assets** - `TSoftObjectPtr<UTexture2D>` loads on demand
5. **Disable Tick when not needed** - `PrimaryActorTick.bCanEverTick = false`
6. **Use timers over Tick for periodic logic** - `GetWorldTimerManager().SetTimer()`
7. **Use const references for FString parameters** - `void Foo(const FString& Name)`
8. **Forward declare in headers, include in cpp** - Faster compile times
9. **Use IsValid() checks** - Not just null checks, also checks pending kill
10. **Profile with Unreal Insights** - Built-in profiling for CPU, GPU, memory

## Common Anti-Patterns

- `Cast<>` in Tick without caching - expensive and repeated
- Raw pointers to UObjects without UPROPERTY - GC can collect them
- Tick enabled on actors that don't need per-frame updates
- Loading assets synchronously on the game thread
- Not calling Super in lifecycle overrides

## Multiplayer Patterns

```cpp
// Server-authoritative function
UFUNCTION(Server, Reliable)
void ServerFireWeapon(FVector Direction);

// Multicast to all clients
UFUNCTION(NetMulticast, Unreliable)
void MulticastPlayFireEffect();

// Client-only
UFUNCTION(Client, Reliable)
void ClientShowDamageNumber(float Amount);

// Replication conditions
void GetLifetimeReplicatedProps(TArray<FLifetimeProperty>& OutProps) const override
{
    Super::GetLifetimeReplicatedProps(OutProps);
    DOREPLIFETIME_CONDITION(AMyCharacter, Health, COND_OwnerOnly);
}
```
