# THUNDERWALKER
## Game Design Document v0.1

**Title:** Thunderwalker
**Tagline:** Hunt the myths. Wear their power. Become legend.
**Genre:** Monster Hunter-style roguelike
**Engine:** nAIVE (Rust-based, YAML + Lua), v0.1.18
**Setting:** Mythological North America
**Status:** Pre-production / Design Phase
**Last Updated:** 2026-03-25

---

## Table of Contents

1. [Vision & Elevator Pitch](#1-vision--elevator-pitch)
2. [Player Character](#2-player-character)
3. [Monster Bestiary](#3-monster-bestiary)
4. [Core Loop](#4-core-loop)
5. [Combat System](#5-combat-system)
6. [World & Biomes](#6-world--biomes)
7. [Roguelike Structure](#7-roguelike-structure)
8. [Crafting & Progression](#8-crafting--progression)
9. [Art Direction](#9-art-direction)
10. [nAIVE Engine Tier Mapping](#10-naive-engine-tier-mapping)
11. [MVP Demo Design](#11-mvp-demo-design)

---

## 1. Vision & Elevator Pitch

### What is Thunderwalker?

Thunderwalker is a Monster Hunter-style action roguelike set in a mythological version of pre-colonial North America. You play as the Seeker — a warrior-shaman who walks between the world of the living and the spirit world — tasked with hunting beings of enormous supernatural power before they tear the balance of the world apart.

Each run takes you into a biome stalked by creatures drawn from actual Indigenous North American mythologies: the cannibal giant of the northern woods, the serpent that rules the deep rivers, the shapeshifting predator that wears the skin of the dead. You hunt them. You harvest them. You wear pieces of what they were and become something harder to kill.

It is not a game about beating a monster. It is a game about becoming worthy of the encounter.

### The Monster Hunter DNA + Roguelike Twist

Thunderwalker inherits Monster Hunter's core tension: careful preparation, long engagements, body-reading enemies with complex multi-phase behaviors, and a crafting system that makes every kill meaningful. The loop is hunt → harvest → craft → upgrade → face something worse.

The roguelike layer changes the stakes. Runs are procedurally structured: biome, weather, monster placement, sacred site locations, and available gear recipes all vary. Death is punishing but not absolute — your Seeker carries forward a subset of unlocked knowledge and spirit bonds. Each run is a complete arc. Each failure teaches you something.

Key differences from Monster Hunter:
- **Runs are bounded** (one biome, 3-5 encounters, ~45-90 minutes)
- **No persistent base** — your camp is assembled from what you carry and find
- **Spirit abilities** are the central power expression, not raw weapon upgrades
- **Death has weight** — certain unlocks require surviving without dying

Key differences from standard roguelikes:
- **Combat is fully real-time action** with positioning, dodge windows, and stamina management
- **Monster encounters are long and deliberate** — not hallway fights
- **Crafting is mid-run**, done at campfires and sacred sites
- **Narrative framing** is consistent across runs — the Seeker is the same person, learning

### Why Native American Mythology?

Because it's a staggeringly rich, largely untapped tradition of genuinely frightening and genuinely sacred beings — and most of the Western gaming canon has ignored it entirely.

The Wendigo alone is one of the most psychologically sophisticated monster concepts in any mythology: a creature born from human transgression, embodying the horror of starvation, cannibalism, and the loss of self. Mishipeshu — the Great Lynx of the deep water — appears across Ojibwe, Algonquian, and Potawatomi traditions as an ambivalent force, dangerous but also a keeper of copper and deep-river knowledge. The Thunderbird is not simply a big bird; in many traditions it is a warrior-being locked in eternal conflict with the underwater powers, its battles manifesting as storms.

These are not generic fantasy monsters. They have specific cultural contexts, specific relationships with specific peoples, and specific meanings. That is exactly what makes them compelling for a game about the weight of a hunt.

### Respect and Authenticity Notes

This section is non-negotiable.

**What we are doing:**
- Drawing on published ethnographic and scholarly sources (Basil Johnston, Vine Deloria Jr., Alfonso Ortiz, Paul Radin, and others)
- Representing creatures from their originating traditions as accurately as game form allows
- Using tribal names where appropriate (Ojibwe, Lakota, Haudenosaunee, Navajo/Diné, etc.) rather than collapsing everything into a vague "Native American"
- Building systems that reflect actual cultural logic: reciprocity, respect for the hunted, spiritual consequence
- Consulting with Indigenous creators, scholars, or community advisors before any public release

**What we are not doing:**
- Using sacred ceremonial practices as game mechanics
- Appropriating specific clan symbols, medicine bundles, or ceremonies
- Portraying living religious traditions as "ancient magic" for player consumption
- Reducing complex beings to stat blocks without their cultural weight
- Using stereotyped visual or audio tropes (headdresses as loot, "war drums" as generic backing music)

**Framing note:** The Seeker is not an outside observer. The Seeker is of this world. The game does not position the player as a colonial explorer discovering exotic monsters. The player *is* the tradition.

**Pre-release requirement:** Before shipping even a public demo, we bring in at least one Indigenous cultural consultant with relevant traditional knowledge to review the bestiary, narrative framing, and art direction. This is a hard gate, not a nice-to-have.

---

## 2. Player Character

### The Seeker

The Seeker is a warrior-shaman hybrid — a figure who exists in multiple traditions: the person chosen (or marked) to walk between the mundane world and the spirit world, often against their preference. They are not a hero in the Western sense. They are *responsible*. The community survives because they go.

The Seeker does not have a fixed name or gender. In the opening sequence, the player names them and chooses their lineage (which determines starting equipment and passive bonuses, not the story).

### Lineage Options

| Lineage | Tradition | Starting Weapon | Passive Bonus |
|---------|-----------|-----------------|---------------|
| Walks-in-Thunder | Lakota-inspired | Spirit Lance | +1 stamina segment at start of run |
| River-Keeper | Ojibwe-inspired | Storm Bow | Spirit Vision lasts 2s longer |
| Red Earth Walker | Navajo/Diné-inspired | Medicine Blade | Crafting produces 1 extra component |
| Stone-Tongue | Haudenosaunee-inspired | Bone Club | Stagger resistance +15% |

Lineage is permanent (per save file) and chosen once. It can be reset with a deliberate "Begin Again" option that wipes all meta-progression.

### Appearance Customization

- Skin tone, face, hair style (range of options across traditions, not costume-bin diversity)
- Base garment color and wrap style
- Starting talisman (cosmetic, but carries narrative flavor text about the Seeker's history)
- Scar patterns (earned through gameplay — each significant death or survival milestone unlocks one)

### Starting Abilities

Every Seeker begins with:

1. **Spirit Sight** — Brief pulse of vision revealing creature weak points and nearby harvestable nodes. 8-second cooldown. The core scouting tool.
2. **Step Aside** — A directional dodge with a generous i-frame window. Stamina cost: 1 segment. The core survival tool.
3. **Tend Wounds** — Consume a carried medicine pouch to restore 40% health. Slow animation (can be interrupted). One use per camp rest unless restocked.

### Progression Arc (Within a Run)

The Seeker grows during a run by accumulating **Spirit Marks** — fragments of essence shed by wounded and slain creatures. Spend them at sacred sites or campfires:

- **Tier 1 (0-5 marks):** Unlock a second Spirit Ability slot
- **Tier 2 (6-15 marks):** Unlock weapon upgrade at campfire
- **Tier 3 (16-30 marks):** Unlock Spirit Bonding with a hunted creature
- **Tier 4 (31+ marks):** Access to Elder tier encounter (final hunt of the run)

Spirit Marks reset each run. Persistent meta-progression is tracked separately (see Section 7).

---

## 3. Monster Bestiary

*Note: Creature behaviors described here are based on documented mythological sources. The in-game Codex (unlocked after first encounter with each creature) will cite the specific traditions and, where possible, specific peoples from which each being originates.*

---

### 3.1 Wendigo

**Lore Origin:** Algonquian-speaking peoples of the northeastern forests and Great Lakes region (Ojibwe, Cree, Innu, and others). The Wendigo (Wiindigo, Wetiko in various spellings) is a spirit of winter starvation — a once-human being that resorted to cannibalism and was transformed, cursed to be perpetually hungry, perpetually cold, perpetually growing so that the food it consumes never satisfies it. It represents a specific moral horror: what happens when survival instinct overrides the reciprocal obligations that hold community together.

**Appearance:** Enormously tall, gaunt beyond natural proportion — ribs visible through paper-thin skin, lips torn back, frost forming on the breath, eyes sunken and yellow. Not monstrous in the creature-feature sense. Monstrous because it was once a person. There are traces of human posture and human grief in its movement. Its footprints in snow are bare human feet, but enormous.

**Behavior:** The Wendigo does not rush. It *converges*. It circles at the edge of sight in blizzard conditions, testing the hunter. It is most dangerous when it stops moving — that means it has decided. It cannot be starved out or waited out. Standing still increases the threat escalation timer. It is drawn to fire (light and warmth are things it remembers wanting) but fire also weakens it.

**Attack Patterns:**
- *Convergence Walk* — Long-range pursuit, crosses distance deceptively fast without appearing to hurry
- *Freeze Breath* — Cone of cold that inflicts Chilled (reduced stamina recovery) and strips i-frames from dodges for 6 seconds
- *The Hunger Grab* — Lunges, grabs the Seeker, holds them for 3 seconds of heavy damage. Can be broken with a well-timed weapon strike during the grab animation
- *Phase 2 — Splinter* — At 40% health, the Wendigo *grows*, shedding its outer skin. Reach increases. New attack: *Howl of Winter* that summons a brief whiteout reducing visibility to near-zero for 8 seconds

**Weaknesses:** Fire damage (Torch weapon infusion, fire-spirit abilities). Sustained loud noise (the Storm Bow's Thunder Shot ability staggers it). Moving camp fire into its patrol path breaks its convergence loop.

**Hunt Rewards:**
- Wendigo Rib Shard — high-tier crafting material, adds Cold Ward to armor
- Frost-Touched Sinew — bowstring material, arrows inflict Chill on hit
- Hunger Fang — rare drop, used in Spirit Bonding to access the Wendigo Spirit ability (see Section 5)
- *Seeker's Codex Entry:* "There is a teaching in many nations that says: a person who eats the flesh of another person becomes something that cannot be filled. The Wiindigo is that teaching made real. Do not pity it. Do not hate it either. It is what happens when a person forgets they are part of something larger than their own hunger."

---

### 3.2 Thunderbird

**Lore Origin:** Widespread across many Plains, Great Lakes, Pacific Northwest, and northeastern nations. In Ojibwe tradition, the Animikiig (Thunderbirds) are powerful spirit beings whose wingbeats make thunder and whose eyes flash lightning — but they are not simply weather phenomena. They are warriors engaged in a cosmic conflict against the underwater powers (Mishipeshu and the great serpents). They are protectors as well as destroyers. Encountering a Thunderbird is not a random event; it means something has drawn its attention.

**Appearance:** Eagle-shaped but wrong in scale — wingspan measured in tens of meters, feathers edged with electrical discharge. The face, in close-up, has something almost human about the eyes: deliberate, considering, old. When it banks in a storm, the clouds seem to move with it rather than around it.

**Behavior:** The Thunderbird does not lurk. It announces itself. Thunder before the encounter. Lightning strikes that crater the approach path. It tests the hunter before committing — early attacks are warnings. Only after the Seeker survives the warning phase does it engage seriously. This is a hunt with two hunters in it.

**Attack Patterns:**
- *Stormcall* — Telegraphed lightning strike at the Seeker's position (dodge window is generous; this teaches the player it has one)
- *Wind Shear* — Passes overhead and generates a concussive air blast, knocking Seeker prone
- *Talon Strike* — Direct grab dive; if it connects, the Seeker is carried up and dropped for fall damage
- *Phase 2 — Full Storm* — At 50% health, the arena becomes an active thunderstorm. Random lightning now also strikes non-targeted positions. Rain reduces fire effectiveness. Thunderbird gains a *Protective Vortex* that deflects projectiles briefly before attacks
- *Lightning Chain* — Hits the Seeker with lightning that then chains to any metal weapons held (electrified status, weapon temporarily locked)

**Weaknesses:** Grounding mechanics — drive bone or stone anchors into the earth near its landing points to reduce its aerial time. Earth-spirit abilities counter its lightning. The Storm Bow (its own element, essentially) does reduced damage — you cannot fight thunder with thunder — but the Spirit Lance's ground-slam ability disrupts its flight pattern.

**Hunt Rewards:**
- Thunderfeather — crafting material for high-mobility armor
- Arc-Charged Talon — weapon infusion component, adds lightning damage with chain potential
- Stormheart — rare drop, used in Spirit Bonding; grants Thunderbird Spirit ability
- *Seeker's Codex Entry:* "To the Anishinaabe, the Animikiig are not enemies. They fight the same enemy you do — the underwater powers that would drag the world below. If a Thunderbird hunts you, ask what you've done to look like what it fights. That's worth knowing."

---

### 3.3 Skinwalker (Yee Naaldlooshii)

**Lore Origin:** Navajo/Diné tradition. This is one of the most sensitive entries in the bestiary. The Yee Naaldlooshii ("with it, he goes on all fours") is not simply a shapeshifter — in Diné teaching, it is a human who has deliberately committed a profound moral transgression to gain dark power, specifically the power to assume animal forms. It is an inversion of the medicine tradition: healing knowledge turned toward harm. The specifics of how this transformation occurs are considered sacred and are not depicted in this game. What the game depicts is the result — a hunter who hunts hunters — and the spiritual weight of confronting something that was once a person.

**Design note:** We deliberately do not show the transformation process or name the transgression. The Codex entry acknowledges this gap directly and explains why.

**Appearance:** Unstable. Shifts between partially-human and partially-animal forms — never fully either. Most commonly encountered in a large canine form, but the silhouette is wrong: proportions that no actual animal shares, movement that is practiced rather than instinctual. Up close, the eyes are human. That is the tell.

**Behavior:** A predator that has studied hunters. It mimics sounds — animal calls, human voices. It will call in the voice of a known companion or family member if it has encountered the Seeker before. It sets ambushes rather than pursuing directly. Its primary advantage is information: it watches before it strikes. The encounter begins not with combat but with a tracking phase where the Seeker must identify which of several moving shadows in a dense environment is actually the target.

**Attack Patterns:**
- *False Trail* — Leaves misleading tracks; following them triggers an ambush
- *Mimicry Howl* — Summons a copy of the Seeker's own weapon type (spectral, lower damage, but distracting)
- *Form Shift* — Mid-combat, shifts form. Each form has different resistances (canine: fast, evasive; bear: high damage, armored; bird: aerial, disengages)
- *Phase 2 — Unraveling* — Below 35% health, the Skinwalker's forms destabilize and it cycles randomly. More aggressive, less telegraphed. Uses *Curse Touch* — contact inflicts Confusion status (controls invert for 5 seconds)
- *The Voice* — Paralyzing howl that mimics the Seeker's own lineage-specific prayer; must be resisted by breaking the status with a medicine item or by landing a hit within the 2-second window

**Weaknesses:** Spirit Sight reveals its true position through all mimicry. Sage smoke (consumable) prevents Mimicry Howl. Medicine Blade's purification strikes deal bonus damage. It cannot maintain Form Shift while afflicted with Burning.

**Hunt Rewards:**
- Shifting Hide — armor material with passive shapeshifting resistance
- False Eye — talisman component, passive detection of mimicry effects
- Unraveled Pelt — rare drop, Spirit Bonding component
- *Seeker's Codex Entry:* "There are things about the Yee Naaldlooshii that are not mine to write down. The Diné have teachings about this being, and those teachings belong to them. What I can say is this: whatever it was before, it made choices that led it here. It is not cursed. It chose. That is worse. Hunt it with medicine. Hunt it with clarity. Do not let it make you doubt what you know."*

---

### 3.4 Horned Serpent (Misi-ginebig / Great Horned Serpent)

**Lore Origin:** The Great Horned Serpent appears across dozens of traditions from the Great Lakes to the Southeast. In Ojibwe tradition, Misi-ginebig (Great Serpent) is one of the Underwater Powers — beings of the deep water who exist in cosmic opposition to the Thunderbirds. It is associated with copper (deposits of native copper along Lake Superior shorelines were attributed to its presence), with the danger of deep water, and with a kind of cold, patient malevolence. It is not evil in a simplistic sense; it is the underwater world asserting itself into the surface world, which is transgressive by nature.

**Appearance:** Massive serpent form, 30+ meters, scaled in deep blue-black with copper-colored horns that glow faintly with bioluminescent light. When partially submerged, only the horns and the ridge of its back are visible — it looks like rocks until it moves. The water around it is abnormally cold and still.

**Behavior:** Territorial. It does not pursue far from water. It will defend deep river channels, lake shores, and flooded lowlands as absolute territory. The encounter is partly a terrain management problem — the Seeker needs to fight it without being dragged into the water, where the Horned Serpent is nearly invincible. It is patient. It can wait under the surface for many minutes, watching through the water with its copper eyes.

**Attack Patterns:**
- *Undertow* — Creates a current that pulls the Seeker toward the water's edge
- *Copper Horn Gore* — Surfaces and sweeps with horns; the contact inflicts Poison
- *Deep Drag* — If the Seeker is in shallow water, attempts to coil and drag them under. Escape via rapid input; fully submerged = instant kill
- *Phase 2 — Shore Break* — At 45% health, uses its bulk to shatter the shoreline terrain, collapsing some safe footing into the water
- *Copper Pulse* — Emits a shockwave from its horns that strips active Spirit abilities and briefly disables Spirit Sight

**Weaknesses:** Thunder-type damage (Thunderbird feather-infused weapons). Elevated terrain (it cannot follow). Fire on the water's surface (Oil Flask consumable + ignition). The Storm Bow's lightning arrow deals significant bonus damage.

**Hunt Rewards:**
- Horned Serpent Scale — high-tier armor material, water resistance
- Copper Horn Fragment — weapon infusion, Poison proc on hit
- Serpent's Eye — rare drop, Spirit Bonding component; deep vision passive
- *Seeker's Codex Entry:* "The Misi-ginebig is not a river monster. It is the river. The copper deposits along the Great Lakes shores — some peoples say they are its shed scales. Respect the water you cross. Don't take more than you need. These aren't just good ideas. They're load-bearing parts of a relationship."*

---

### 3.5 Stone Giants (Chenoo / Kiwakwa)

**Lore Origin:** The Chenoo appears in Wabanaki (Abenaki, Penobscot) traditions and related peoples of the northeastern coast. Like the Wendigo, the Chenoo is sometimes described as a human transformed — in some accounts, a person whose heart has been replaced by ice, who becomes a cannibal giant. In other accounts, it is a primordial creature of stone and cold. For gameplay purposes, we draw on the stone-body tradition: a being whose flesh has calcified into granite-like substance, enormously strong, associated with avalanches and rockslides.

**Appearance:** Humanoid, three to four times human height, with skin that has become grey-brown stone. Joints crack when it moves — literally, stone cracking. Its face retains human structure but fossilized, as though a person has been turned to rock mid-expression. Eyes glow faint amber. When it stands still in rocky terrain, it is nearly invisible.

**Behavior:** Slow, deliberate, territorial in the sense of a geological feature rather than an animal. It does not chase over long distances. It establishes a patrol and anything that enters is crushed. Its strategy is endurance — it outlasts everything. High health pool, extremely high defense against normal damage, slow attack animations with devastating payoff. A fight against a Chenoo is a long grind that must be managed carefully.

**Attack Patterns:**
- *Ground Pound* — Area of effect slam, fractures terrain in a radius, creates difficult-to-navigate rubble zone
- *Boulder Throw* — Rips a boulder from the terrain and hurls it. Destroys any crafted barriers or fortifications
- *Stone Skin* — Passive: most damage is reduced by 40%. Specific attack types bypass this (see weaknesses)
- *Phase 2 — Collapse* — At 50% health, body begins shedding stone fragments. Slower movement but explosive burst range increases. New attack: *Rockfall* (wide AoE falling rocks from above)
- *Crush* — If the Seeker is cornered against terrain with no dodge options, the Chenoo uses a slow, unstoppable two-hand crush

**Weaknesses:** Fire (cracks stone, increases damage intake for 15 seconds). The Bone Club's percussive attacks bypass Stone Skin passive. Targeting the exposed joint points (glowing amber points at knees and elbows) deals 2x damage. Water damage (freezes the cracks, destabilizes stone structure).

**Hunt Rewards:**
- Stone Shard — common, heavy armor crafting material
- Granite Heart — rare, talisman component, passive damage resistance
- Amber Eye Fragment — rare drop, Spirit Bonding component
- *Seeker's Codex Entry:* "Some say the Chenoo is a person. Some say it is older than people. Either way, what you're fighting is something that has lost the ability to be anything other than what it is. There is a specific sadness to that kind of hunt. Take it seriously."*

---

### 3.6 Deer Woman

**Lore Origin:** The Deer Woman appears across many Plains nations and others — in Lakota, Ponca, Cherokee, Creek, and other traditions. She is a figure of duality: beautiful, seductive, appearing as a young woman at dances or at the edge of camp. She lures men (primarily men in the source material, though the game abstracts this) away from their people. Those who follow her are found dead, trampled by deer hooves. She is not simply a predator — she is a test. She appears specifically when a person is not being honest with themselves, when desire overrides judgment, when selfishness has displaced community obligation.

**Gameplay note:** The Deer Woman encounter is deliberately the most psychologically uncomfortable hunt in the game. The opening phase involves the Seeker having to recognize her, which requires suppressing an in-game "pull" mechanic (a subtle controller vibration / screen vignette that represents the compulsion she induces). Failing to recognize her in time triggers a damage phase where she reveals her true form.

**Appearance:** Human phase: a young woman in the distance, facing away, impossible to see clearly. Deer phase: lower body is a deer's (powerful, muscular haunches and hooves), upper body shifts to the human form twisted and elongated. The face is beautiful and wrong simultaneously.

**Behavior:** The encounter has two phases separated by a recognition moment. She does not simply attack — she maneuvers the Seeker into vulnerable positions. She uses terrain, uses the player's dodge habits against them (she is the only enemy whose movement pattern adapts to observed dodge patterns). In deer phase, she is fast, hit-and-run, circling.

**Attack Patterns:**
- *Compulsion* — Aura effect that pulls Seeker toward her location slowly; Spirit Sight breaks it
- *Hoof Strike* — Devastating close-range kick; can one-shot at low health
- *Circle Dance* — Moves in widening spirals, disorienting; hits from every direction in rapid succession
- *Phase 2 — Fury* — Once recognized, she drops the human form and becomes a pure predator. Speed nearly doubles. *Trample* — charges through Seeker's position repeatedly; dodge timing window is tight
- *Ghost Deer* — Summons two spectral copies; all three are visually identical; one is real

**Weaknesses:** Cedar smoke (consumable) dispels Compulsion. Spirit Sight reveals which copy is real. The Medicine Blade's purification strike deals bonus damage throughout the encounter. She will not cross running water (positioning mechanic — lure her toward river crossings).

**Hunt Rewards:**
- Deer Woman Hide — light armor material, stealth bonus
- Hoof Shard — weapon infusion, movement speed on hit
- Duality Antler — rare drop, Spirit Bonding component; passive: compulsion effects have reduced duration
- *Seeker's Codex Entry:* "The Deer Woman doesn't appear to people at random. She appears to people who are already off-balance — who are already choosing desire over obligation. Before you hunt her, it's worth asking what she was responding to. That's not a comfortable question. Good."*

---

### 3.7 Underwater Panther (Mishipeshu)

**Lore Origin:** Mishipeshu (also Great Lynx, Underwater Panther) is one of the most important and widely depicted beings in Ojibwe, Potawatomi, and other Algonquian traditions. Petroglyphs of Mishipeshu exist at Agawa Rock on Lake Superior's north shore — some of the most significant rock art in North America. Mishipeshu guards the copper of the lake bottom, causes dangerous rapids and currents, and can be placated or antagonized. It is one of the central underwater powers in perpetual cosmic conflict with the Thunderbirds. It is not unambiguously evil — offerings were made to it; it was respected. It is dangerous the way a waterfall is dangerous: it is a power that does not particularly care about you.

**Appearance:** The size of a large bear, with the body of a great cat (lynx form), a long reptilian tail that ends in a copper-barbed spike, feline ears that pick up sound acutely, and a hide that shifts between deep blue-black fur and metallic copper plating in the light. When it moves through water, no ripple. When it moves on land, it moves like water — fluid, impossibly quiet.

**Behavior:** Ambush predator. Prefers water-adjacent terrain but is genuinely dangerous on land. Unlike the Horned Serpent, it does not anchor to water — it pursues. Its strategy is to deny the Seeker safe zones: using its tail to destroy terrain features, using its copper plating to deflect projectiles at angles, positioning to take away dodge options. Very high mobility. Fights from advantage positions.

**Attack Patterns:**
- *Silent Step* — Can become temporarily invisible in shadow or near water; revealed by sound or Spirit Sight
- *Copper Tail Whip* — Wide-angle attack that also deflects ongoing projectiles back at the Seeker
- *Rapid Mauling* — 4-hit combo that each hit stagger-builds; full combo = stagger
- *Phase 2 — Copper Rage* — At 40% health, the copper plating spreads and hardens. Conventional weapons deal -25% damage. Seeker must find and target the exposed fur sections (Spirit Sight marks them). Attack speed increases significantly
- *Water Surge* — If near water, can summon a sudden surge that floods a section of the arena

**Weaknesses:** Thunder-type attacks crack copper plating. Fire temporarily reveals its position when invisible. The Spirit Lance's heavy strikes can break the copper plating permanently on specific body sections. Elevated positions reduce its ambush effectiveness.

**Hunt Rewards:**
- Mishipeshu Copper Scale — high-tier armor material, significant physical defense
- Great Lynx Claw — weapon material, fastest base attack speed modifier
- Copper Heart — rare drop, Spirit Bonding component; passive: silent movement, reduced enemy detection range
- *Seeker's Codex Entry:* "There are pictographs of Mishipeshu on the rocks at Agawa Bay that are older than anything I can name. People left offerings at the water's edge before crossing Lake Superior. That's not superstition — that's earned knowledge of a force that can kill you, expressed in the form of respect. Bring that respect into the hunt."*

---

### 3.8 Bear Walker

**Lore Origin:** The Bear Walker (Makwa Nini in some Ojibwe usage, though terminology varies by community) is a figure distinct from the Wendigo and Skinwalker — a specific category of medicine practitioner who has turned power toward harm, with particular ability to travel in bear form. Accounts exist across Ojibwe, Potawatomi, and related nations. Like the Skinwalker, this is a figure that was once human and chose a path that led them here. Unlike the Wendigo, the transformation is deliberate and ongoing.

**Gameplay note:** The Bear Walker is the most human-feeling of the monsters, which makes it one of the hardest encounters emotionally. Its attacks feel personal. It uses hunting knowledge — it knows what you're doing before you do it.

**Appearance:** Bear-shaped but subtly wrong in the same way as the Skinwalker — the posture sometimes shifts upright, the eyes are intelligent in a way bears are not, and occasionally the face is almost recognizable as human. Larger than a natural bear, with medicine markings that appear as scars or painted patterns on the fur — these are weapons-resistant areas.

**Behavior:** Tactical. Will circle a campfire to assess the hunter before approaching. Uses terrain intelligently — circles behind, uses trees as cover. Can disappear (human form travel) and reappear at a new angle. The Bear Walker also has a *counter-tracking* mechanic: if the Seeker uses Spirit Sight too frequently, the Bear Walker detects it and sets an ambush at the Seeker's position.

**Attack Patterns:**
- *Charge* — Forward rush with high damage; well-telegraphed but fast
- *Maul* — Close-range sustained attack, 3-hit combo each hit inflicting Bleed
- *Spirit Intercept* — If the Seeker uses a Spirit Ability, the Bear Walker can attempt a counter-strike in the animation window; encourages not spamming abilities
- *Phase 2 — Ancestral Fury* — At 35% health, medicine markings glow. Enters a frenzied state; attacks are faster and no longer telegraphed normally. Summons two *Spirit Bears* (spectral, low health, annoying) that circle the Seeker
- *Bear Form Dissolution* — Once per encounter at very low health, briefly returns to human form. In human form it is temporarily vulnerable but the Seeker's Spirit abilities are disabled — you cannot use spiritual power against a suffering human. Forces a choice: hit harder with mundane attacks, or wait.

**Weaknesses:** Cedar smoke reveals true form and prevents Spirit Intercept. Sage oil on the Medicine Blade deals bonus damage to medicine markings. The Bone Club's heavy impacts deal 1.5x damage to bear-form. The human-form window is the highest damage window if the Seeker has any medicine-infused weapons.

**Hunt Rewards:**
- Bear Walker Pelt — armor material, Bleed resistance
- Medicine Scar Plate — rare material, resistance to spirit-suppression effects
- Fractured Soul Shard — rare drop, Spirit Bonding component; passive: Spirit Intercept resistance
- *Seeker's Codex Entry:* "There are things that happen in a person that lead them to this. I don't know what they were. The traditions that speak of beings like this are careful about what they say out loud — some things, spoken, become more real. What I know is that this being made choices. So did I. The difference matters, even if I can't always see it clearly."*

---

## 4. Core Loop

### The Hunt Loop

```
PREPARE → TRACK → ENGAGE → HARVEST → CRAFT → REST → ESCALATE
```

**Prepare:** At run start and at each campfire, the Seeker organizes their loadout: equipped weapon, 3 consumable slots, equipped armor set, active Spirit Ability (max 2 slots). Resources from previous encounter carry forward within the run.

**Track:** Each encounter begins with a tracking phase — following signs (prints, broken vegetation, disturbed water, the specific environmental changes each creature causes) to the monster's current position. Good tracking reveals weaknesses and behavior cues. Poor tracking (rushing) means approaching from a disadvantaged angle.

**Engage:** The actual combat encounter. Monster Hunter-paced — long, deliberate, reading patterns and finding windows. Typical encounter: 8-20 minutes depending on preparation and player skill.

**Harvest:** After a kill (or a failed hunt where the creature retreats), the Seeker has 90 seconds to harvest parts from the carcass. Number of harvest nodes depends on how cleanly the kill was executed. Damage to specific body parts during combat increases harvest yield from those parts (cutting the tail = guaranteed tail material).

**Craft:** At campfires and sacred sites, combine harvested materials into new armor pieces, weapon upgrades, or consumables. The crafting interface is fast — no mini-game. Recipes are discovered by examining monsters during combat (Spirit Sight reveals available recipe components).

**Rest:** At campfire, restore stamina segments, restock one medicine use, burn Spirit Marks for progression upgrades. Optional: review Codex entries for the creatures encountered.

**Escalate:** Each completed hunt increases the run's threat tier, unlocking harder variants, elite creatures, and eventually the Elder encounter that closes the run.

### Roguelike Run Structure

A run consists of:

1. **Approach** — Brief traversal scene, world-building, optional gathering
2. **Three Hunt Encounters** — Escalating difficulty, procedurally assigned from the active biome's roster
3. **Sacred Site** — Guaranteed rest point between encounter 2 and 3; crafting opportunity, lore unlock, Spirit Bonding if eligible
4. **Elder Hunt** — The run-closing encounter. Always a named, full-difficulty creature. Success = run complete.

Total run time: 45-90 minutes at expected skill level.

### What Persists (Between Runs)

- **Codex entries** — All lore and creature knowledge
- **Recipes learned** — Any crafting recipe discovered in a run is permanently unlocked
- **Spirit Bonds** — Once formed with a creature, the associated Spirit Ability is permanently available
- **Lineage unlocks** — New lineage options unlocked through specific achievement conditions
- **Scar patterns** — Cosmetic records of significant moments
- **World Map progress** — Encountering a biome for the first time unlocks it on the world map

### What Resets (Each Run)

- All harvested materials
- All crafted gear (except one "heirloom" item designated at end of run — you carry one piece forward, degraded)
- Spirit Marks and within-run progression
- Consumable stocks
- Active Spirit Ability slots (you must re-earn them each run via Spirit Marks)

### Meta-Progression System

The **Keeper's Fire** — a meta-hub between runs — represents accumulated knowledge and preparation:

- **Story threads** — short vignette sequences unlocked by completing specific run conditions (e.g., "Hunt the Wendigo without using fire" unlocks a Codex story about the first hunter who faced a Wendigo)
- **Wisdom Tokens** — earned for completing runs, dying in notable ways, or achieving first kills; spent to unlock new starting consumable recipes
- **Reputation** — abstract measure of how the Seeker is regarded in the spirit world; affects passive bonuses at sacred sites (higher reputation = better bonuses)
- **Challenger Seals** — optional hard-mode modifiers that, when completed, unlock cosmetic rewards and advanced story content

---

## 5. Combat System

### Core Feel

Combat in Thunderwalker is slow compared to most action games and faster than it looks. Every action has weight. Dodges cost resources. Healing is slow. The player is not fast enough to beat a Thunderbird by button-mashing. The player must read the monster.

Target frame rate: 60fps. Combat resolution on the nAIVE engine using its entity/component system for hitbox management.

### Weapon Types

#### 5.1 Spirit Lance

**Feel:** Long-range poke + counter-attack. The most technically demanding weapon; rewards positional mastery.

**Moveset:**
- *Thrust* — Fast, long-range poke. Low damage per hit, high hit rate.
- *Wide Sweep* — Horizontal arc, good for multiple targets or large bodies
- *Ground Anchor* — Drives the lance into terrain; briefly immobilizes the Seeker but creates a "tether" — the next hit from the monster triggers an automatic counter-thrust dealing 2x damage
- *Vault Strike* — Uses the lance as a pole vault to launch into a high-damage overhead strike

**Spirit Infusion:** Charges with spirit energy during combo sequences; at full charge, *Spirit Burst* releases a wave of energy in a line.

**Best against:** Thunderbird (ground anchor counters its dive), Chenoo (vault strike bypasses Stone Skin on overhead)

---

#### 5.2 Storm Bow

**Feel:** Ranged precision with elemental ammo management. Highest skill ceiling; most information-gathering tool.

**Moveset:**
- *Standard Shot* — Fast, moderate damage, infinite ammo
- *Charged Shot* — Hold to charge; fires one of three elemental ammo types (Fire, Thunder, Cold) depending on charge duration
- *Spirit Sight Shot* — Brief draw-back that marks an enemy's weak point on release; marked targets take +20% damage for 8 seconds
- *Thunder Shot* — Special ability (costs 1 Spirit charge); AoE stagger, effective against flying enemies

**Spirit Infusion:** Elemental ammo types are gained from Spirit Bonds with elemental creatures.

**Best against:** Wendigo (Thunder Shot stagger), Thunderbird (ground-type charged shot), Misi-ginebig (lightning arrows)

---

#### 5.3 Bone Club

**Feel:** Slow, devastating, breaks things. The highest per-hit damage in the game. Brutally simple; hard to master.

**Moveset:**
- *Overhead Smash* — Massive damage, huge telegraph, can break armor/plate on monsters
- *Horizontal Swing* — Wide arc, staggers smaller creatures
- *Ground Wave* — Slams the ground, sends a shockwave along the terrain surface
- *Counter Brace* — Planting the club and bracing; if hit during brace, the Seeker takes half damage and the monster bounces back, creating a free-attack window

**Spirit Infusion:** Each hit builds a resonance meter; at max resonance, next hit deals 3x damage with a shockwave AoE.

**Best against:** Chenoo (percussive attacks bypass Stone Skin), Bear Walker (bone club impacts deal 1.5x in bear-form), Skinwalker (break Form Shift armor)

---

#### 5.4 Medicine Blade

**Feel:** Fast, technical, synergizes with Spirit Abilities and consumable chemistry. Highest ceiling for players who understand the full system.

**Moveset:**
- *Quick Slash* — Fastest attack in the game; low individual damage, high hit rate
- *Purification Strike* — Charged slash that deals bonus damage to corrupted/cursed beings; cleanses Debuffs on the Seeker if it connects
- *Compound Cut* — Multi-hit sequence; each hit applies the current infusion effect (requires medicine pouch resource)
- *Seal Strike* — Rare use; leaves a *mark* on the monster that disrupts Spirit Abilities on the target for 10 seconds

**Spirit Infusion:** Can hold multiple infusion types simultaneously (up to 2); switching is free but costs a quick animation.

**Best against:** Deer Woman (purification bonus), Skinwalker (purification bonus), Bear Walker (medicine scar targeting)

---

### Dodge/Parry System

**Dodge:** Directional, costs 1 stamina segment. Has a generous i-frame window in the middle of the animation. Dodge timing is monster-specific — the Deer Woman's attacks require a shorter-interval dodge than the Chenoo's telegraphy. Learning dodge timing for each monster is core skill expression.

**Sidestep:** A shorter, faster directional move with no i-frames but no stamina cost. Used for repositioning rather than invincibility.

**Parry:** Weapon-specific. Only available on the Medicine Blade (active parry) and Spirit Lance (Ground Anchor auto-parry). Successful parry creates a large free-attack window and staggers the monster. Failed parry (wrong timing) removes stamina immediately and leaves the Seeker open.

**Counter Window:** After a successful dodge (rolling through an attack during i-frames), there is a 0.5-second window for a *Counter Strike* — a fast, bonus-damage attack that does not cost stamina. Learning to consistently convert dodges into counter strikes is the skill gap between good and great play.

### Spirit Abilities

Spirit Abilities are unlocked by completing a Spirit Bond with a creature (requires a rare drop from that creature — see Bestiary). They are powerful, situational, and cost Spirit resource.

**Examples:**

| Ability | Source | Effect | Spirit Cost |
|---------|--------|--------|-------------|
| Wendigo Hunger | Wendigo | AoE frost burst around Seeker; inflicts Chill on all nearby enemies | 2 |
| Thunderbird Dive | Thunderbird | Seeker launches into air and dive-strikes; unblockable, high stagger | 3 |
| Mishipeshu Step | Mishipeshu | 2-second invisibility; next attack deals 2x damage from stealth | 2 |
| Horned Surge | Misi-ginebig | Projectile water/copper lance; penetrates monster armor | 2 |
| Bear Form | Bear Walker | Temporary +50% HP and damage; Seeker cannot use other abilities during | 4 |
| Deer Phase | Deer Woman | Brief compulsion aura; enemy attacks re-target away from Seeker for 4s | 2 |
| Storm Feather | Thunderbird | Passive (always active once bonded): movement speed +10%, dodge costs -0.5 stamina | — |

Maximum 2 Spirit Ability slots active per run (expanded to 3 at high Reputation meta-level).

### Stamina / Spirit Resource Management

**Stamina:** 5 segments baseline (6 with Walks-in-Thunder lineage). Regenerates completely in 4 seconds when not performing stamina-costly actions. Attacks do not cost stamina — only dodges, some special weapon moves, and sprinting. Running out of stamina means no dodges, which is often death.

**Spirit Resource:** Separate bar, fills passively during combat (0.1 per second) and actively by landing strikes in combo sequences. Maximum 6 Spirit points. Abilities cost 2-4. Regeneration is interrupted by taking damage (1-second pause). Hoarding spirit charges for critical moments is a core strategic decision.

**Interaction:** Using a Spirit Ability during a stamina-depleted state does not restore stamina. There is no shortcut out of the resource hole — manage both or pay consequences.

---

## 6. World & Biomes

### Overview

Thunderwalker's world is mythological North America — not cartographic North America. Biomes exist as distinct regions with their own spiritual character, ecological behavior, and roster of creatures. The world map is stylized, not accurate; it is how the world feels from inside the tradition, not how it looks from a satellite.

Sacred geography is respected: no specific real-world sacred sites are depicted as game locations. The sacred sites in the game are fictional locations consistent with the spiritual logic of each biome's traditions.

---

### 6.1 Great Plains

**Tradition touchpoints:** Lakota, Cheyenne, Comanche, Crow, Pawnee
**Terrain:** Vast grassland, river valleys, badland formations, seasonal wetlands
**Atmosphere:** Open sky. You are exposed here. The horizon is a constant presence.

**Weather effects:**
- *Storm Front* — 20% visibility reduction; Thunderbird encounter probability increases; lightning strikes on high ground
- *Dust Storm* — Near-zero visibility; tracking becomes purely sound-based; Skinwalker prowls during these
- *Clear Night* — Star navigation possible; sacred sites pulse faint light; Deer Woman appears only on clear nights
- *High Heat* — Stamina regeneration -20%; water sources critical; Horned Serpent activity near rivers increases

**Day/Night effects:**
- Dawn and dusk: enhanced Spirit Sight duration (+50%)
- Night: creature aggression ranges shift; some creatures (Deer Woman, Skinwalker) are exclusively nocturnal; campfire is critically important for camp defense
- Midday: hardest conditions in high heat weather; most creatures retreat to shade and water

**Sacred Sites:**
- *Buffalo Stone Ring* — Standing stone circle at the top of a rise; crafting bonus: weapon infusion material quantities doubled
- *Vision Ledge* — A natural elevated platform where the sky is fully visible; meditating here restores all Spirit charges and grants a brief prophetic vision of the next encounter (shows one attack pattern preview)

**Creature Roster:** Thunderbird, Deer Woman, Skinwalker, Wendigo (in winter variant run), Horned Serpent (near rivers)

---

### 6.2 Northern Forest

**Tradition touchpoints:** Ojibwe, Cree, Haudenosaunee, Algonquin, Wabanaki
**Terrain:** Dense boreal forest, frozen lakes, river systems, granite outcroppings, wetland/bog
**Atmosphere:** Enclosed, layered, constantly sighing. Sound carries strangely. You are being watched from the moment you enter.

**Weather effects:**
- *Blizzard* — Near-zero visibility; Wendigo encounter probability spikes dramatically; fire is wind-threatened
- *Freezing Rain* — Ice layer on terrain surfaces; sliding physics; stamina cost of running increases
- *Thaw* — Early spring; ice gives way unexpectedly; safe paths through frozen lakes collapse
- *Heavy Snow* — Tracking is easier (clear prints) but movement is slowed; Chenoo camouflage in snowdrifts is nearly perfect

**Day/Night effects:**
- Night in the Northern Forest is genuinely dangerous; Wendigo and Bear Walker are more active, more aggressive
- Midwinter: shortest days; night encounters are more likely regardless of player intent
- Northern Lights (rare event): Spirit Sight is passively active for the duration; all Spirit ability costs reduced by 1 for the encounter

**Sacred Sites:**
- *Old Growth Council* — A grove of ancient trees that have been culturally modified (not depicted as specific real cultural practice); the sense of weight and age here restores full health between encounters
- *Copper Deposit Shore* — A lakeshore with copper mineral deposits; Mishipeshu-related crafting materials available; high risk, Mishipeshu patrol chance significant

**Creature Roster:** Wendigo, Mishipeshu, Misi-ginebig, Chenoo, Bear Walker

---

### 6.3 Desert Southwest

**Tradition touchpoints:** Navajo/Diné, Hopi, Zuni, Apache, Pueblo peoples
**Terrain:** Red sandstone canyon systems, mesas, desert flats, arroyos, ancient structures (culturally respectful depictions)
**Atmosphere:** Ancient. Vast. The rock here remembers. Everything is visible at distance but details are hidden in shadow.

**Design note:** This biome required the most careful handling. Pueblo and Diné sacred spaces are real, ongoing places. No specific real ruin, pueblo, or sacred landscape is replicated. The aesthetic draws on geological character (canyon, mesa, desert light) not specific cultural architecture.

**Weather effects:**
- *Flash Flood* — Arroyos fill instantly; terrain reshapes; Horned Serpent active in flood channels
- *Dust Devil* — Minor wind vortices; briefly disorient; Skinwalker uses them as approach cover
- *Desert Night* — Temperature drops sharply; fire sources are survival tools, not just utilities; star navigation
- *Monsoon* — Heavy rain transforms the desert; mud slows movement; previously dry creek beds become traversal hazards

**Day/Night effects:**
- Daytime heat: stamina recovery penalty; certain creatures are crepuscular (active at dawn/dusk only)
- Night in desert: Skinwalker, Deer Woman active; reduced heat penalty; ambient navigation changes
- Dawn light: specific rock face locations reveal pictograph-style visual cues that hint at creature weaknesses (if the Seeker pauses to look)

**Sacred Sites:**
- *Canyon Shrine* — A wind-carved natural alcove with an ancient fire-keeping site; bonus: consumable recipes involving desert plants available here exclusively
- *Mesa Summit* — Exposed, high ground; Thunderbird encounters triggered from here but with positional advantage; panoramic weather reading

**Creature Roster:** Skinwalker, Deer Woman, Thunderbird (storm-calling variant), Horned Serpent (desert water source variant)

---

### 6.4 Pacific Coast

**Tradition touchpoints:** Tlingit, Haida, Chinook, Salish, Yurok, Makah
**Terrain:** Temperate rainforest, sea cliffs, river estuaries, kelp forest coast, fog
**Atmosphere:** Layered, wet, alive. The Pacific Coast rainforest is one of the most biologically dense environments in North America. Everything competes for light. Rivers matter here.

**Design note:** Pacific Northwest traditions have rich visual traditions (totem art, formline design) that are themselves complete artistic systems. This biome draws on the ecological and narrative logic of those traditions without attempting to replicate their specific art forms (formline design is not UI decoration here — it would require the same consultation requirement as the bestiary).

**Weather effects:**
- *Heavy Fog* — Visibility cut to 15m; all creatures operate in near-ambush range; Spirit Sight range reduced
- *Storm Surge* — Sea flooding on coastal terrain; some paths become impassable
- *River Run* — Salmon run season; specific consumable materials available; Mishipeshu and river predators more active
- *Clear Coast* — Rare; all visibility and navigation bonuses; best tracking conditions

**Day/Night effects:**
- Tidal cycle (simulated): low tide opens coastal terrain features; high tide floods them
- Night fog: compound visibility reduction; most dangerous navigation conditions in the game

**Sacred Sites:**
- *River Mouth Offering Point* — Cultural logic: reciprocal offering before taking from the river; leaving a gathered material here restores harvested material quantities for the next hunt
- *Sea Stack* — Isolated coastal pillar accessible via low tide only; rare coastal-specific materials; Thunderbird nesting indication

**Creature Roster:** Thunderbird (coastal variant, ocean-storm behaviors), Mishipeshu (sea variant), Bear Walker, Deer Woman (twilight fog variant)

---

### 6.5 Arctic Tundra

**Tradition touchpoints:** Inuit, Yupik, Inupiaq, Aleut/Unangan
**Terrain:** Open tundra, sea ice, ice floes, tundra rivers, permafrost coastal features
**Atmosphere:** Absolute exposure. No cover. No shade. The light here is either permanent day or permanent night depending on season. Everything that lives here has adapted to survive conditions nothing should survive.

**Design note:** Arctic traditions have distinct spiritual frameworks from subarctic and temperate nations. The creatures here (primarily Wendigo variants and Arctic-specific beings) are placed carefully. This biome has the highest research debt of the five and will require the most intensive consultation work before it is finalized.

**Placeholder creatures pending consultation:** An Arctic sea-giant figure, a storm-spirit, and at minimum one creature specific to marine/sea ice environments.

**Weather effects:**
- *Whiteout Blizzard* — Zero visibility; navigation by sound and vibration only
- *Sea Ice Break* — Moving terrain; ice floes shift; falling through is potentially fatal
- *Polar Night* — Extended night conditions; all nocturnal creature bonuses compound
- *Arctic Wind* — Constant stamina drain from cold exposure; fire is survival necessity

**Day/Night effects:**
- Midnight sun / polar night: extended day or night depending on run parameters; affects all light-dependent creature behaviors
- Aurora Borealis (equivalent effect to Northern Lights above)

**Sacred Sites:**
- *Ice Cairn* — Ancient navigation marker; restores directional orientation; brief protection from cold exposure
- *Breathing Hole* — Sea ice hunting platform; specific consumables and unique sea-mammal materials available; risk of Ice Break event

**Creature Roster:** Wendigo (Arctic variant, deadliest form), Chenoo (ice-body variant), [Arctic-specific creatures TBD]

---

## 7. Roguelike Structure

### Run Length and Structure

A standard run consists of:

```
[Biome Entry] → [Hunt 1] → [Campfire Rest] → [Hunt 2] → [Sacred Site] → [Hunt 3] → [Elder Hunt]
```

- **Hunt 1:** Threat Tier 1. Introductory encounter with one of the biome's roster. Good teaching opportunity; moderate danger.
- **Campfire Rest:** Full health restore, consumable restock (partial), Spirit Mark spend.
- **Hunt 2:** Threat Tier 2. More complex encounter; may be a different creature or an elite version of Hunt 1's creature.
- **Sacred Site:** Full health, crafting access, Spirit Bonding opportunity, one Codex unlock, Reputation gain.
- **Hunt 3:** Threat Tier 3. Difficult encounter; creature has seen the Seeker before (behaviorally — it is more aggressive, uses more of its pattern toolkit).
- **Elder Hunt:** Named creature, full difficulty, unique intro sequence. This is the hardest fight of the run by design.

Estimated completion time at target skill level: 50-75 minutes. Speedrun pace: 30 minutes. First-timer pace: 90+ minutes.

### Permadeath vs Soft Death

Thunderwalker uses **Soft Death:**

- On HP reaching zero, the Seeker is *incapacitated* rather than killed outright.
- The Seeker can be revived by consuming a rare "Return" item (one may be carried per run, found during traversal/sacred sites, not guaranteed) — revive at 30% HP.
- If no Return item, the run ends. This is a failed run.
- Failed runs still award: any Codex entries discovered, any recipes learned that run, a fraction of Wisdom Tokens based on how far the run progressed.

**Death variants:**
- *Clean Death* (HP depleted, no revival) — standard fail state
- *Catastrophic Failure* (fall, drowning, being dragged under by Misi-ginebig) — run ends immediately, no revival possible
- *Retreat* (intentional run abandonment at campfire) — preserves slightly more meta-progress than a death

**Hard Difficulty Option:** Full permadeath. Unlocked after completing 3 normal runs. Rewards exclusive cosmetic unlocks and a specific Codex story chain.

### Unlockables Between Runs

From the **Keeper's Fire:**

1. **Lineage Unlocks** — New lineage options via specific achievement (e.g., "Survive an Elder Hunt using only Standard Shot" unlocks the River-Keeper lineage)
2. **Wisdom Recipes** — Spend Wisdom Tokens on new starting-consumable recipes
3. **Heirloom Designation** — After a successful run, choose one crafted item to carry forward (degraded; must be repaired on a subsequent run)
4. **Challenger Seals** — Optional modifiers: no campfire restores, no Spirit Abilities, complete a run without using consumables, etc. Completing seals unlocks narrative content and cosmetics
5. **Story Threads** — Vignette sequences at the Keeper's Fire that expand world-building; unlocked by first encounters, notable achievements, specific kill conditions

### Difficulty Scaling

Base difficulty is fixed. Difficulty is modified by:

- **Biome selection** — Arctic Tundra runs are harder than Great Plains runs structurally
- **Challenger Seals** — Player-chosen hard mode modifiers
- **Run streak bonus** — Consecutive successful runs (no deaths) increase creature aggression slightly and increase reward yield proportionally
- **Spirit Reputation level** — Higher reputation unlocks more powerful sacred site bonuses but also causes creatures to recognize the Seeker earlier (shorter tracking phase, faster aggression trigger)

No artificial difficulty curve outside player control. The game is hard. Players improve by learning creature patterns, not by grinding stats.

---

## 8. Crafting & Progression

### Monster Part Harvesting

After a kill (or creature retreat at low HP), a **Harvest Window** opens: 90 seconds.

The carcass has 3-5 harvest nodes depending on:
- Kill quality (cleaner kills = more nodes)
- Body part damage (damaged parts yield that part's material)
- Knife type (Medicine Blade increases yield by 1 node)

Harvest nodes:
- *Common nodes* — always present, yield common materials
- *Rare nodes* — appear based on kill quality; yield rare materials
- *Spirit node* — appears rarely (1 in 5 hunts); yields Spirit Bonding component

Harvesting costs time, not resources. The Seeker cannot be attacked during harvest but weather and environmental hazards continue.

**Quick Harvest** vs **Full Harvest:**
- Quick Harvest (30 seconds): guarantees common materials only
- Full Harvest (90 seconds): full yield; risk of environmental event

### Gear Tiers

| Tier | Name | Materials | Defense | Notes |
|------|------|-----------|---------|-------|
| 1 | Seeker's Base | Starting equipment | Low | Starting loadout; not replaceable by harvest |
| 2 | Gathered | Plains/forest gathered materials | Medium-Low | Crafted at campfire; no special effects |
| 3 | Monster-Touched | Common monster parts | Medium | Passive resistance to that monster type |
| 4 | Spirit-Woven | Rare monster parts | Medium-High | One active Spirit bonus per piece |
| 5 | Elder-Forged | Elder hunt rare parts | High | Full set bonus; unique Spirit effects |

Full set bonuses:
- Full Wendigo set (5 pieces): Cold immunity + permanent Chill aura around Seeker
- Full Thunderbird set: Aerial movement (short glide on dodge) + arc-damage retaliation
- Full Mishipeshu set: Silent movement + passive projectile deflection
- Mixed sets are viable; set bonuses don't activate but individual piece bonuses stack

### Spirit Bonding System

Spirit Bonding represents the Seeker forming a relationship with the essence of a hunted creature — not ownership or domination, but acknowledgment. The creature's power is held in trust.

**Process:**
1. Obtain the Spirit Bonding component (rare drop from a creature)
2. Perform the Bonding at a Sacred Site (not a campfire — only sacred sites have enough resonance)
3. Select which Spirit Ability is granted by that Bond
4. Bond persists as a meta-unlock; the Ability is available in future runs without re-earning (though it must be equipped in the active slot at run start)

**Limit:** Maximum 8 Spirit Bonds total (one per creature in the base bestiary). Choosing which 2 to equip per run is a meaningful decision.

**Spirit Bond Lore:** Each bond comes with a short piece of Codex text — the creature's side of the encounter, told in first person. These are the most sensitive pieces of writing in the game and will receive the heaviest cultural review.

---

## 9. Art Direction

### Visual Style

**Painted/Illustrated — not photorealistic.**

The primary reference is the visual tradition of ledger art — the Plains tradition of narrative painting on flat surfaces — and the graphic power of petroglyphs and rock art as pure image-making. This doesn't mean the game looks like flat 2D art; it means the color, shape, and outline language comes from those traditions rather than from photorealistic rendering.

Specific style notes:
- **Outlines are present and intentional** — creatures have a strong silhouette read first, detail second
- **Color is expressive, not literal** — the Wendigo's frost isn't gray-blue because ice is that color; it's gray-blue because cold and hunger and isolation are that color
- **Light is used as a narrative tool** — sacred sites glow in specific ways; corrupted creatures have a specific quality of wrong light
- **Scale is exaggerated** — creatures are larger than realistic scale to communicate mythological weight; the Thunderbird fills the sky because that's what a Thunderbird is

### Color Palette Per Biome

| Biome | Primary | Secondary | Accent | Feel |
|-------|---------|-----------|--------|------|
| Great Plains | Ochre, burnt sienna | Sky blue, sage | Storm grey | Vast, exposed |
| Northern Forest | Deep pine, shadow blue | Snow white, iron grey | Amber (fire, aurora) | Dense, cold, watching |
| Desert Southwest | Sandstone red, canyon orange | Turquoise, bone | Deep shadow black | Ancient, spatial |
| Pacific Coast | Rainforest green, fog grey | Cedar brown, ocean blue | Salmon pink (fish run) | Layered, alive |
| Arctic Tundra | Ice white, frost blue | Midnight grey | Aurora green/violet | Absolute, inhuman |

Creature colors are distinct from their biomes — they should be immediately readable against their environment. The Wendigo is bone-white against the Northern Forest's greens. Mishipeshu is copper-bright against the dark lake water.

### UI Philosophy

**Diegetic where possible.**

- Health is represented by a beaded band at the bottom of screen — beads disappear with damage, are added with healing. No numbers by default.
- Stamina segments are visualized as breath (visual puffing, rate of movement, slight vignette at exhaustion)
- Spirit resource is a small painted symbol that fills with color; it does not require reading
- Monster health has no visible bar — behavior and sound cues tell the Seeker when a creature is weakening. This is deliberate and consistent with the hunting context: you read the animal, not a meter.

**HUD minimalism:** The screen should, in a screenshot, look like a painting of the encounter — not an interface with a game embedded. Information is present but woven in.

**Font:** A custom letterform drawn from Indigenous visual language principles — clean, strong, no serifs, no grunge. Not a pastiche of any specific tradition's writing system.

**Sound design principle:** Environmental audio is real (wind, water, specific animal sounds of each biome). Monster audio is designed; the Wendigo's breath, the Thunderbird's wing-thunder, the crack of the Chenoo's stone joints are sound designed from scratch. No "generic Native American soundtrack" — the music system is reactive ambient, driven by tension state, not looping background tracks.

---

## 10. nAIVE Engine Tier Mapping

### Current Capability: Tier 3, v0.1.18

Based on the nAIVE engine's current architecture (Rust core, YAML scene definition, Lua scripting):

#### Buildable NOW (v0.1.18)

**Scene System:**
- Static biome scenes defined in YAML with entity placement, terrain objects, traversal zones
- Weather state machine (basic: clear/storm/night — implemented as flags affecting Lua behavior scripts)
- Campfire entity with interaction zone, inventory management, rest state trigger

**Entity/Combat:**
- Player entity with stamina segments, HP segments, equipped weapon slot, Spirit resource float
- Monster entity with HP, phase triggers (percentage-based), basic state machine (patrol → alert → attack → retreat)
- Hitbox system for melee attacks (range + angle check)
- Projectile entities (Storm Bow arrows)
- Dodge i-frame window via state + timer

**Lua Scripting:**
- Monster behavior scripts: patrol loops, attack pattern selection, phase transitions
- Crafting recipes as data (YAML) + validation logic (Lua)
- Spirit Sight reveal mechanic (highlight entity components on keypress + timer)
- Harvest window: timed loop with node interaction

**Audio:**
- Positional audio for entities
- Ambient state tracks (tension level mapping)
- Monster sound cues

**Buildable NOW — MVP scope:**
- One biome (Northern Forest)
- One monster with full phase 2 behavior (Wendigo — best fit for current state machine complexity)
- Spirit Lance weapon with full moveset
- Basic crafting (2 recipes)
- Spirit Sight ability
- Harvest window
- Codex entry display

---

#### Needs Future Tiers

**Tier 4 (estimated):**
- Procedural biome layout generation (terrain placement, traversal path generation)
- Full run structure (multiple encounters, Sacred Site progression logic)
- 3+ monsters with full behavior trees
- All 4 weapon types with full movesets
- Heirloom persistence system
- Spirit Bonding system

**Tier 5 (estimated):**
- Full bestiary (8 creatures, all biomes)
- Meta-progression (Keeper's Fire, Wisdom Tokens, Reputation)
- Full weather system with all modifiers
- Full run procedural generation
- All crafting recipes
- Sound design complete

**Tier 6+ (estimated):**
- Full art pass (painted/illustrated visual style at production quality)
- Full Codex with cultural review
- All Spirit Bonds and abilities
- Controller support, accessibility options
- Save/load system for meta-progression
- Performance optimization for full encounter complexity

---

### MVP Demo Scope (Tier 3 Deliverable)

A **playable 3-5 minute demo scene** that demonstrates:
- Core combat loop (attack, dodge, Spirit Sight, harvest)
- One monster fight through Phase 1 and Phase 2
- One craft at campfire
- One Spirit Ability use

See Section 11 for full specification.

---

## 11. MVP Demo Design

### Demo Title: "First Hunt — The Wendigo at Frozen Creek"

**Biome:** Northern Forest (winter)
**Monster:** Wendigo (full Phase 1 + Phase 2)
**Expected Run Time:** 3-5 minutes
**Player Weapon:** Spirit Lance

---

### Scene Layout (YAML Structure)

```yaml
scene:
  id: demo_frozen_creek
  biome: northern_forest
  weather: blizzard_approach  # starts clear, transitions to blizzard at 40% monster HP
  time_of_day: dusk

  terrain:
    - id: creek_bed
      type: frozen_water
      passable: true
      notes: "Ice cracks if Wendigo uses Ground Pound within 3 units"
    - id: treeline_north
      type: dense_forest
      passable: false
      notes: "Wendigo patrol boundary"
    - id: treeline_south
      type: dense_forest
      passable: false
      notes: "Player spawn side"
    - id: campfire_site
      type: clearing
      position: [0, 0]
      radius: 8
      notes: "Starting campfire — interactable for rest/craft"
    - id: approach_path
      type: forest_trail
      notes: "Tracking phase path — Wendigo prints visible here"

  entities:
    - id: player_seeker
      type: player
      position: [0, -15]
      weapon: spirit_lance
      consumables:
        - medicine_pouch: 1
        - torch: 2
      spirit_slots: 1  # demo only unlocks one
      
    - id: wendigo_01
      type: monster
      subtype: wendigo
      position: [0, 30]
      phase: 1
      
    - id: campfire_01
      type: campfire
      position: [0, -5]
      interactable: true
      craft_recipes:
        - recipe_id: cold_ward_wrap  # basic armor component
      
    - id: harvest_node_common_01
      type: harvest_node
      linked_to: wendigo_01
      material: wendigo_rib_shard
      
    - id: harvest_node_rare_01
      type: harvest_node
      linked_to: wendigo_01
      material: frost_touched_sinew
      spawn_chance: 0.6
```

---

### Monster Behavior Script (Lua)

```lua
-- wendigo_demo.lua
-- Demo-specific Wendigo behavior: teaches convergence and Phase 2 transition

local wendigo = {}

function wendigo:on_spawn(entity)
  entity.state = "patrol"
  entity.patrol_radius = 20
  entity.convergence_timer = 0
  entity.player_visible = false
end

function wendigo:on_update(entity, dt, world)
  local player = world:get_player()
  local dist = entity:distance_to(player)

  if entity.state == "patrol" then
    -- Circle at edge of visibility
    entity:patrol_circle(entity.patrol_radius)
    
    -- Demo hint: show Wendigo silhouette at edge of blizzard fog
    if dist < 40 and dist > 25 then
      entity:set_visibility("silhouette")  -- partial reveal
    end

    -- Transition to convergence when player approaches or uses Spirit Sight
    if dist < 25 or player:used_spirit_sight() then
      entity.state = "convergence"
      entity:play_sound("wendigo_awareness")
    end
    
  elseif entity.state == "convergence" then
    entity:move_toward(player, speed=2.5)  -- deceptively fast
    entity.convergence_timer = entity.convergence_timer + dt
    
    -- Attack selection
    if entity:in_attack_range(player, range=4) then
      local attack = entity:select_attack({"freeze_breath", "hunger_grab", "convergence_walk"})
      entity:execute_attack(attack, player)
    end
    
  elseif entity.state == "phase2" then
    entity:set_scale(1.3)  -- visually grows
    entity:play_sound("wendigo_phase2_howl")
    world:trigger_weather("blizzard_active")
    entity.state = "phase2_combat"
    
  elseif entity.state == "phase2_combat" then
    entity:move_toward(player, speed=3.0)
    if entity:in_attack_range(player, range=5) then
      local attack = entity:select_attack({"freeze_breath", "hunger_grab", "howl_of_winter", "convergence_walk"})
      entity:execute_attack(attack, player)
    end
  end
end

function wendigo:on_hp_threshold(entity, threshold, world)
  if threshold == 0.4 and entity.state ~= "phase2" then
    entity.state = "phase2"
    -- Brief cinematic pause — 1.5 seconds
    world:pause_combat(1.5)
    world:play_cutscene("wendigo_growth")
  end
  
  if threshold == 0.0 then
    entity.state = "dead"
    world:trigger_harvest_window(entity, duration=90)
    world:play_sound("wendigo_death")
    world:weather_transition("clearing")
  end
end

function wendigo:on_player_stationary(entity, duration, world)
  -- Wendigo is drawn to stillness — escalates threat
  if duration > 5 then
    entity:increase_aggression(0.1)
  end
end

return wendigo
```

---

### Demo Flow — Beat by Beat

**00:00 — Scene Opens**
The Seeker stands at the campfire at dusk. Light snow. The campfire is lit. Tutorial text (can be dismissed): "Your camp. Your fire. Something is wrong with the forest tonight."

**00:15 — Campfire Interaction**
Player approaches campfire. Craft menu shows one recipe: Cold Ward Wrap (requires 2x Pine Resin — harvestable nearby). Tutorial: craft the item for passive cold resistance. This teaches the crafting interface.

**01:00 — Tracking Phase**
Wendigo prints appear on the approach path (large, barefoot, human-shaped, enormous). Sound design: distant creak of tree, unnaturally cold breath. Tutorial: "Follow the signs."

**01:30 — First Contact**
Wendigo silhouette visible at 30 units, circling. Spirit Sight tutorial: hold key/button to reveal weak points (ribcage, exposed joints marked). Player approaches and the Wendigo enters convergence state.

**02:00 — Phase 1 Combat**
Full combat begins. The demo encounter is designed to introduce: dodge and counter window (Wendigo's Convergence Walk is slow enough to teach this), Freeze Breath (teaches stamina management — i-frames stripped), Hunger Grab (teaches interrupt window — Ground Anchor parry on Spirit Lance is the intended counter).

**03:00 — Phase 2 Transition**
At 40% HP, Phase 2 triggers. Blizzard activates — visibility drops. Wendigo grows. New sound design. Tutorial note: fire-type attacks deal bonus damage now.

**04:00 — Phase 2 Combat**
Howl of Winter introduces the 8-second whiteout — player navigates by memory and sound. Torch consumable can be used to create a fire zone (teaches consumable utility). Spirit Ability (unlocked from Spirit Mark earned mid-fight): one-use ability from earlier run knowledge (demo gives the player one pre-bonded ability: Thunderbird Dive as a dramatic finisher option).

**04:30 — Kill / Harvest**
Wendigo death animation. Harvest window opens: 90 seconds. Two guaranteed nodes, one conditional rare node. Tutorial: different harvest nodes, time pressure.

**05:00 — Demo End State**
Harvest completes. Codex entry for Wendigo unlocks. Credits roll with the Codex text displayed. Demo loop-back to main menu with prompt: "The forest has more to teach."

---

### What the Demo Proves

1. ✅ Core combat feel — dodge/counter rhythm, stamina management
2. ✅ Monster phase system — P1 → P2 transition, behavior change
3. ✅ Spirit Sight functionality — reveal system
4. ✅ Weather as gameplay — blizzard visibility, fire utility
5. ✅ Crafting interface — one recipe, clear UI
6. ✅ Harvest system — timed window, multiple nodes
7. ✅ Codex / tone — lore delivery, respectful framing
8. ✅ Tone and visual style — first impression of the world

---

## Appendix: Open Questions & Production Gates

### Research/Consultation Required Before Public Demo

- [ ] Engage at least one Ojibwe/Anishinaabe cultural consultant for Wendigo and Mishipeshu entries
- [ ] Engage at least one Navajo/Diné consultant for Skinwalker/Yee Naaldlooshii entry
- [ ] Engage at least one Lakota consultant for Seeker lineage and Great Plains biome
- [ ] Review all Codex text with relevant consultants before any external showing
- [ ] Confirm Bear Walker terminology is appropriate with Ojibwe/Potawatomi consultants
- [ ] Arctic biome creature roster requires full research pass before design work begins

### Design Questions Open

- [ ] What is the right name for the player character's role? "Seeker" is a placeholder; consult on appropriate terminology
- [ ] Exact Keeper's Fire meta-hub design — UI approach for between-run space
- [ ] Companion NPC? Some Monster Hunter-style games have village characters; would this work in the Thunderwalker framing?
- [ ] Multiplayer/co-op scope — out of scope for MVP but worth designing for from the start if desired
- [ ] Platform targets — PC first, console later? Mobile excluded?

### nAIVE Engine Dependencies

- [ ] Confirm physics system supports ice/terrain deformation (frozen creek crack mechanic)
- [ ] Confirm audio system supports positional monster sounds with occlusion
- [ ] Confirm Lua can access weather state for monster behavior scripts
- [ ] Confirm YAML scene format supports linked harvest nodes
- [ ] Profile combat hitbox system at expected monster scale (Wendigo is 3x human height)

---

*Document version 0.1 — Pre-production. All designs subject to revision based on cultural consultation, playtesting, and engine capability development.*

*This document is confidential and intended for internal development use only.*
