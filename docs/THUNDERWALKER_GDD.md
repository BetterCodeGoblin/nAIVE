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
| Sky-Weaver | Wyandotte/Wendat-inspired | Trading Hatchet | Clan-based buff: +10% crafting efficiency when holding three different material types |

Lineage is permanent (per save file) and chosen once. It can be reset with a deliberate "Begin Again" option that wipes all meta-progression.

### Appearance Customization

- Skin tone, face, hair style (range of options across traditions, not costume-bin diversity)
- Base garment color and wrap style
- Starting talisman (cosmetic, but carries narrative flavor text about the Seeker's history)
- Scar patterns (earned through gameplay — each significant death or survival milestone unlocks one)

### 2a. The Sky-Weaver (Wyandotte/Wendat Lineage)

**Heritage:** The Wyandotte (Wendat) are an Iroquoian-speaking confederation from the Great Lakes region, historically centered around present-day southern Ontario and the Georgian Bay area. The Wyandotte Confederacy was organized into three clans — Turtle, Bear, and Beaver — each with distinct responsibilities to the whole. Their economy was built on sophisticated trading networks spanning from the Atlantic coast to the Mississippi River. The Sky Woman creation myth, central to Haudenosaunee and related Iroquoian traditions, describes the first woman falling from Sky World and being caught by animals, creating Turtle Island (North America).

**Seeker Type:** The Sky-Weaver is a diplomat-hunter — a Seeker trained in the art of reciprocal exchange and covenant-making. They do not hunt to dominate, but to establish relationship and balance. Their power comes not from individual prowess but from the strength of their connections and the depth of their spiritual alliances.

**Starting Equipment:**
- **Trading Hatchet** — A compact, balanced blade tool used historically for trade, travel, and hunting. Fast attacks, moderate damage, and acts as both weapon and utility tool. Special ability: *Exchange Strike* — grants +1 Spirit charge to you and transfers +1 Spirit charge to allies/constructs within 8m for 6 seconds (useful in multiplayer or co-op scenarios; in single-player, stacks with summoned spirits). Innate passive: crafting produces +1 extra component of random type.

**Lineage Passive — Clan Bond:** Select a clan affiliation at run start:
- **Turtle Clan** — Earth connection; +20% physical defense, -10% Spirit resource recovery
- **Bear Clan** — Combat connection; +15% damage output, -10% stamina recovery rate
- **Beaver Clan** — Trade connection; +25% crafting efficiency, -10% max health

Once selected, the clan bonus persists for the run. At sacred sites, you can perform a *Covenant Ritual* to switch clans (costs 1 Spirit Mark). Switching grants a 30-second buff (+30% to the new clan's bonus) before the new clan becomes active.

**Unique Ability — Sky World Sight:** Once per encounter, the Sky-Weaver can perform a brief meditation that reveals all weak points, harvestabl nodes, and hidden paths to the spirit realm simultaneously for 8 seconds. This is more powerful than Spirit Sight but has a 4-minute cooldown and cannot be used during combat (enemies reset their alert state if used mid-fight). Codex lore ties this to the Sky Woman teaching of interconnectedness.

**Thematic Connection:** The Wyandotte Confederacy's strength came from unity-in-diversity, with each clan contributing its gifts to the whole. The Sky-Weaver embodies this through their clan system, where different covenant choices create different playstyles, and the ability to switch them emphasizes adaptability and balance. Unlike the solitary prowess of the Walks-in-Thunder or the mystical focus of Red Earth Walker, the Sky-Weaver's power is relational.

---

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

### 3.9 The False Trader (Gauhéta / Trade Spirit Corrupted)

**Lore Origin:** Wyandotte/Wendat tradition. The Gauhéta in uncorrupted form is a spirit guide associated with fair trade and reciprocal exchange — the kind of spirit that helped the confederacy's trading networks thrive. However, when a Seeker strays too far from the principles of covenant and balance, the Gauhéta inverts: it becomes the False Trader, a being that offers deals too good to refuse, then collects in ways you didn't agree to.

**Gameplay note:** The False Trader is unique in that it does not immediately attack. The first phase is negotiation-based. If the Seeker accepts a trade deal, their abilities are temporarily modified (sometimes for better, sometimes worse). Refusing the deal triggers combat. This makes it a psychological hunt as much as a physical one.

**Appearance:** Humanoid but mercurial. Its form shifts between various guises — a friendly Wyandotte trader, a glossy-skinned figure made of wampum shells, a shape made entirely of trade goods (copper, furs, woven cloth) that blur together. Its true form is never entirely stable. When angered, it becomes skeletal, with hollowed eyes that glow like lit fires.

**Behavior:** Cunning and deliberately evasive. It does not engage in straightforward combat — it uses manipulation, summons false copies of the Seeker's own inventory (illusory items that burn the Seeker's stamina if used), and creates zones where traded resources must be handed over to pass through. The False Trader is vulnerable only when its deception is directly challenged — when the Seeker deliberately destroys a false item or walks away from a deal.

**Attack Patterns:**
- *Deceptive Offer* — Presents three trade options, each modifying a stat. Must select one; incorrect choice causes debuffs; correct choice grants minor buff
- *Wampum Shatter* — Throws shells that create zones; traversing without a shell causes Confused status
- *False Echo* — Summons copies of the Seeker that mimic their attacks with stolen Spirit abilities
- *Phase 2 — The Untrading* — At 50% health, reveals its true form. All previous trades are reversed (buffs become debuffs). Only way to end the fight is to land three Truth Strikes (attacks that destroy the False Trader's held items)
- *Covenant Break* — If the Seeker refuses three consecutive trade offers, the False Trader enters a rage state. Damage output increases 3x, but all attacks become blockable with the Shield Wall ability

**Weaknesses:** Direct, honest combat (no Spirit Abilities — the False Trader draws power from spiritual deception). Destroying illusions reduces its health directly. Cedar smoke prevents new trade offers from being generated. The Trading Hatchet's *Exchange Strike* causes the False Trader's buffs to swap with the Seeker's debuffs, often putting the monster at disadvantage.

**Hunt Rewards:**
- Wampum Shell Fragment — crafting material, enables "truthful" armor that reveals enemy stats
- False Trader's Ledger — unique item, grants +20% to material gained from hunts but attracts the False Trader to future encounters
- Covenant Breach Stone — rare drop, Spirit Bonding component; passive: trade-based effects have 50% reduced duration, but you gain +25% to material hoarding
- *Seeker's Codex Entry:* "The Gauhéta teaches a hard lesson. The confederacy's traders made their reputation on honest dealing, on covenants that everyone understood. This being — this corrupted echo — exists because someone forgot that principle. If you hunt it, remember: fair dealing is not weakness. It is strength."*

---

### 3.10 The Turtle Titan (Skenandoah / Turtle Island Guardian)

**Lore Origin:** Wyandotte and Haudenosaunee creation myth. In the Sky Woman story, after falling from Sky World, the sky woman was caught on Turtle's back. From there, the world was built — earth piled on the turtle's shell, creating Turtle Island (North America). The Turtle Titan in its balanced form is a protector, a bearer of ancient stability. But when greed and disrespect accumulate, the Turtle Titan wakes angry.

**Gameplay note:** This is the "nature's wrath" encounter for the Wyandotte, tied to the ecological balance theme. The arena itself is alive — forest floor has predator pits, roots that grab, and shifting terrain. The Turtle Titan is slow but nearly immobile and incredibly tanky.

**Appearance:** Titanic turtle, 20+ meters long, with a shell that is a fully-realized ecosystem: moss, trees, streams, birds all living on its back. The shell is covered in ancient petroglyphs that glow softly. Eyes are deep amber, older than anything. When wounded, earth bleeds from the wounds — literal soil and roots spilling out.

**Behavior:** Stationary by design. It does not chase — it is defended by the terrain around it. The arena is its body. Walking on the shell is walking through layers of ecosystem. As the hunt progresses and the Titan is damaged, more of the shell collapses or transforms, making some paths impossible and opening new ones. The fight is less about "hitting the boss" and more about navigating a catastrophically transforming landscape while the Titan's slow, heavy attacks reshape everything.

**Attack Patterns:**
- *Shell Crash* — Shakes violently, throwing players into the air, collapsing terrain sections
- *Root Surge* — Sends roots crawling across the arena that grab players and inflict Rooted status (cannot move for 4 seconds)
- *Slow Pursuit* — Despite its size, moves surprisingly far when it chooses to, crushing terrain; creates new obstacles but opens new paths
- *Phase 2 — Shell Breaking* — At 60% health, petroglyph symbols crack. Each cracked symbol opens a pit beneath, but also removes the Titan's defense in that area (must navigate to cracked areas to deal damage)
- *Rebirth* — At 35% health, the Titan partially retreats into its shell. New creatures (forest elemental spirits) spawn from the environmental debris; they protect the Titan; the Seeker must clear them to re-engage

**Weaknesses:** The ecosystem on its back is vulnerable to fire (destroys armor value of that section). Earthquake-type moves (Bone Club ground waves, Thunder-based impacts) cause the Titan to temporarily lose position and slide backward. Once a section of shell is damaged enough, the exposed interior (soft earth-core) takes 3x damage. Navigation (finding safe paths through the breaking terrain) is as important as damage output.

**Hunt Rewards:**
- Shell Fragment (Petrified) — highest-tier armor material, extremely heavy, highest defense
- Root Tendril — weapon material, adds bleeding / nature damage on hit
- Titan's Heart (Core Stone) — rare drop, Spirit Bonding component; passive: phase through terrain once per 30 seconds, ground-based attacks cost 25% less stamina
- *Seeker's Codex Entry:* "The Turtle that holds the world isn't angry at us — it's angry at what we've done to the world it holds. This hunt isn't about defeating the Titan. It's about earning its forgiveness. Tread carefully. Respect what you're standing on. Every footstep matters."*

---

## 4. Core Loop

### The Hunt Loop

```
PREPARE → TRACK → INTERPRET → ENGAGE → HARVEST → TELL → REST → ESCALATE
```

**Prepare:** At run start and at each campfire, the Seeker organizes their loadout: equipped weapon, 3 consumable slots, equipped armor set, active invocations, and one chosen combat emphasis. Preparation is not just numerical optimization, it is deciding what kind of answer the Seeker intends to bring into the next encounter.

**Track:** Each encounter begins with a tracking phase, following signs such as prints, broken vegetation, disturbed water, weather changes, animal silence, and residue left by spirit influence. Good tracking reveals not just location, but behavior logic.

**Interpret:** Before the real fight begins, the player reads the being. What kind of force is it. What does it punish. What pattern is it repeating. This is the layer that separates Thunderwalker from pure action games. The Seeker is trying to understand the encounter's story before forcing the issue.

**Engage:** Combat is a call-and-response duel. The creature declares intent through posture, sound, weather, arena shifts, and attack windup. The Seeker responds with the right family of actions, sometimes by direct violence, sometimes by grounding, baiting, enduring, or breaking ritual pressure.

**Harvest:** After a kill, retreat, or resolved encounter, the Seeker has a limited time to gather parts, signs, and traces. Clean, respectful hunts produce better rewards. Reckless, panicked fights still produce materials, but less insight.

**Tell:** At campfires and sacred sites, the Seeker reflects on the hunt. This is where Codex lore, interpretation notes, unlocked responses, and story threads come together. The game should feel like the player is carrying forward lessons, not just loot.

**Rest:** Restore stamina segments, recover medicine, bind one new lesson into the run, and decide whether to keep pressing forward. Rest is both mechanical recovery and narrative reset.

**Escalate:** Each resolved hunt increases the run's intensity, unlocking harder variants, stronger spirit weather, stricter encounter rules, and eventually the Elder Hunt that closes the run.

### Roguelike Run Structure

A run consists of:

1. **Approach** — Brief traversal, gathering, camp setup, early signs
2. **Two to Three Hunts** — Escalating encounters shaped by the active biome's roster and spiritual state
3. **Sacred Site or Story Site** — Guaranteed reflection point between major hunts, used for invocation swaps, story interpretation, or covenant choices
4. **Elder Hunt** — The run-closing encounter, always a named, full-difficulty creature with a strong call-and-response identity

Total run time target: 35-60 minutes for the first full slice, expandable later.

### What Persists (Between Runs)

- **Codex entries** — lore, observed patterns, and cultural notes
- **Responses learned** — permanently unlocked Medicine, Trick, or Trial options earned through use and discovery
- **Spirit Bonds** — if retained, framed less as spell collecting and more as relationship-based invocations
- **Lineage unlocks** — new Seeker origins or story lenses
- **Scar patterns** — cosmetic memory of major successes or failures
- **Story Threads** — fragments of teachings, warnings, and remembered encounters
- **World Map progress** — biome knowledge and notable sites

### What Resets (Each Run)

- most harvested materials
- crafted temporary gear and consumables
- Presence modifiers gained during the run
- situational buffs, temporary vows, and challenge conditions
- active encounter-specific response loadout refinements

### Meta-Progression System

The **Keeper's Fire** remains the meta-hub between runs, but it should feel less like a stat kiosk and more like an oral memory place.

- **Story Threads** — short scenes, teachings, remembered warnings, and post-hunt reflections unlocked through specific encounter behavior
- **Wisdom Tokens** — earned for meaningful play, such as reading a boss correctly, surviving with composure, or resolving a hunt through a difficult response path
- **Reputation** — how the Seeker is regarded among spirits, ancestors, and communities, affecting later encounter tone and sacred-site options
- **Challenger Seals** — optional hard-mode vows with clearer narrative meaning than generic skull modifiers

---

## 5. Combat System

### Core Feel

Combat in Thunderwalker should feel deliberate, readable, and slightly uncanny, closer to an N64-era boss adventure in silhouette clarity and strong pattern identity than to modern animation-heavy action sludge.

The player is not meant to win through long combo strings or pure dodge mastery. The player wins by:
- reading the creature
- preserving composure
- answering the correct pattern with the correct response family
- choosing when to attack and when to interpret

This keeps the combat connected to storytelling and the Seeker's medicine-person / hunter role.

### Combat Pillars

#### 5.1 Call and Response

Every major encounter is structured like a conversation.

The creature makes a **Call** through:
- body language
- voice or sound design
- weather or arena change
- movement rhythm
- territorial behavior
- spirit pressure

The Seeker gives a **Response** through action.

Examples:
- A Wendigo emits hunger pressure and converges through fear. The correct answer is not endless rolling, but grounding, spacing, then punishing overreach.
- A Thunderbird charges the arena with storm force. The correct answer is to anchor, endure, and counter at the moment of discharge.
- Mishipeshu denies safe space. The answer is to reposition intelligently, break its confidence, and force it out of fluid control.

This is the signature identity of the game.

#### 5.2 Three Response Families

All meaningful combat options belong to one of three families:

##### Medicine
Used to restore balance, clear harmful influence, ground space, and protect the Seeker.

Examples:
- ash circle
- cleansing breath
- smoke charm
- ward mark
- spirit anchor

Use Medicine against:
- fear effects
- curses
- confusion
- frenzy pressure
- corruption fields

##### Trick
Used to misdirect, lure, out-position, and expose beings that rely on dominance or predation.

Examples:
- false trail
- decoy rattle
- bait toss
- echo step
- lure mark

Use Trick against:
- ambushers
- chargers
- shapeshifters
- territorial predators
- enemies that overcommit when teased into motion

##### Trial
Used to stand ground, answer a challenge, and prove resolve through timing and courage.

Examples:
- challenge stance
- brace counter
- vow strike
- precise interrupt
- ritual parry

Use Trial against:
- duelists
- storm beings
- prideful guardians
- monsters that respect endurance more than evasiveness

This system gives combat a narrative grammar without turning it into a card game.

### Primary Combat Resource: Presence

Replace the generic spirit-resource emphasis with **Presence** as the main expressive resource.

Presence is the Seeker's composure, authority, and spiritual steadiness inside the encounter.

You lose Presence by:
- panic dodging
- taking fear or confusion hits
- violating encounter logic
- overusing strong invocations without setup
- being cornered or spiritually overwhelmed

You gain Presence by:
- correct reads
- clean counters
- holding ground when appropriate
- executing the right response at the right time
- resolving encounter mechanics without flinching

Presence fuels:
- Medicine responses
- Trick maneuvers
- Trial counters
- phase-control invocations
- certain finishers and story-specific interactions

This is more thematic than mana and makes the player's emotional state part of the system.

### Player Verbs

The player verb set should stay intentionally small and expressive:
- light attack
- heavy attack
- dodge step
- sidestep
- brace / guard
- invoke Medicine
- invoke Trick
- invoke Trial
- interact with sign, object, or ground mark

The depth comes from encounter design, not move-list bloat.

### Weapon Identity

Weapons should reinforce response style rather than become combo encyclopedias.

#### 5.3 Spirit Lance

**Role:** Reach, anchoring, interception.

**Fantasy:** The hunter who controls distance and makes the creature regret forward commitment.

**Key moves:**
- *Thrust* — safe poke and spacing tool
- *Wide Sweep* — broad control vs circling targets
- *Ground Anchor* — plant into earth to enable a Trial-style counter
- *Vault Strike* — high-commitment punish on exposed targets

**Best use:** Trial-heavy players, storm encounters, large-beast pattern punishment.

#### 5.4 Storm Bow

**Role:** Read, mark, provoke, punish from intent rather than spam.

**Fantasy:** The Seeker who studies and tags the being before committing to damage.

**Key moves:**
- *Standard Shot* — low-commitment pressure
- *Charged Shot* — elemental or utility response based on the current fight
- *Sight Mark* — reveals or highlights true vulnerability state
- *Thunder Shot* — brief interruption and rhythm break

**Best use:** track-heavy players, aerial or elusive creatures, readable boss phases.

#### 5.5 Bone Club

**Role:** Space denial, brace, break, and certainty.

**Fantasy:** The Seeker who answers force with rooted force.

**Key moves:**
- *Overhead Smash* — high commitment, high consequence punish
- *Horizontal Swing* — reclaim close space
- *Ground Wave* — area denial and rhythm disruption
- *Counter Brace* — absorb impact and return it

**Best use:** stubborn enemies, armored phases, Trial play, breaking false confidence.

#### 5.6 Medicine Blade

**Role:** Cleansing, tagging, interrupting, and precision expression.

**Fantasy:** The Seeker who works close, reads corruption, and answers it cleanly.

**Key moves:**
- *Quick Slash* — tempo control
- *Purification Strike* — anti-corruption punish
- *Compound Cut* — layered effect application
- *Seal Strike* — marks a being to suppress a dangerous behavior temporarily

**Best use:** corrupted or deceptive enemies, Medicine-heavy players, close-quarters technical play.

### Dodge, Brace, and Counter

**Dodge Step:** Strong i-frames, real commitment, punishable when spammed. Use to cross danger, not to erase it.

**Sidestep:** Short, cheap repositioning with no safety blanket. Useful for N64-style readable spacing and quick angle correction.

**Brace:** The key defensive verb. Some attacks should be braced, not rolled. This helps break the modern-action habit of making dodge the answer to everything.

**Counter Window:** The best damage windows come after a correct read, not after arbitrary combo extender prompts.

### Status and Pressure States

Avoid too many RPG debuffs. Use a tight set of states with strong narrative meaning:
- **Fear** — reduced Presence gain, shaky movement timing
- **Chilled** — slower recovery, heavier spacing mistakes
- **Confused** — reduced read clarity, false prompts, audio deception
- **Marked** — the creature has committed to you or you have sealed it into a punishable state
- **Grounded** — storm or spirit pressure reduced, safer to brace
- **Exposed** — brief vulnerability after a correct response

### Why it stays mechanically interesting

The interesting part is not stat complexity. It is that the same boss can be approached through:
- Medicine answers
- Trick answers
- Trial answers
- different weapons
- different levels of narrative understanding

That creates story-shaped mastery.

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

**Stylized, readable, N64-ish in spirit, not retro as a gimmick.**

The visual target is not literal Nintendo 64 rendering. The target is the design clarity that era often had at its best:
- strong silhouettes
- bold color separation
- compact readable arenas
- instantly legible enemy states
- mechanic-first presentation

Pair that with painted texture sensibility, ledger-art influence, and petroglyph-inspired shape language.

Specific style notes:
- **Silhouette comes first** — every monster should read from a distance in one glance
- **Materials are simplified** — broad value groups, not noisy realism
- **Color is expressive** — hues communicate spiritual state, danger, mood, and elemental change
- **Animation readability matters more than fidelity** — clear telegraphs beat hyper-detailed motion
- **Arenas are stage-like** — shaped to support memory, rhythm, and call-and-response encounters

This gives the project a distinct identity and keeps combat readable.

### N64-ish Presentation Principles

- Chunky, memorable forms over micro-detail
- High contrast boss states
- Strong environmental landmarking
- Screen-readable effects with disciplined particles
- Camera composition that supports lock-on and arena learning
- Stylized UI motifs instead of busy overlays

The point is not nostalgia for its own sake. The point is mechanical honesty.

### Color Palette Per Biome

| Biome | Primary | Secondary | Accent | Feel |
|-------|---------|-----------|--------|------|
| Great Plains | Ochre, burnt sienna | Sky blue, sage | Storm grey | Vast, exposed |
| Northern Forest | Deep pine, shadow blue | Snow white, iron grey | Amber, aurora green | Dense, cold, watching |
| Desert Southwest | Sandstone red, canyon orange | Turquoise, bone | Deep shadow black | Ancient, spacious |
| Pacific Coast | Rainforest green, fog grey | Cedar brown, ocean blue | Copper, salmon pink | Layered, alive |
| Arctic Tundra | Ice white, frost blue | Midnight grey | Aurora green/violet | Absolute, inhuman |

Creature palettes should pop against their home biome without feeling divorced from it.

### UI Philosophy

**Readable, restrained, partly diegetic.**

- Health is a beaded or marked band, not a giant fantasy HUD slab
- Presence is shown through a clean icon, color intensity, and character-state feedback
- Stamina is shown through breath, posture, and a minimal segmented readout
- Enemy health should be minimal or absent, favoring behavior tells and visible phase language

The player should feel like they are reading the encounter, not spreadsheets.

### Sound Design Principle

Environmental sound stays grounded. Creature sound is authored and mythic. Music should support tension and memory, not flatten everything into generic "tribal" wallpaper. Rhythm should matter in combat cues, but without turning the whole game into a rhythm game.

---
## 10. UE5 Prototype Mapping

### Current Goal

Thunderwalker's next practical step is a UE5 prototype that proves the combat language and encounter readability before any large-scale content push.

That prototype should prioritize:
- one compact biome slice
- one fully legible boss encounter
- one small player moveset
- one Presence loop
- one Medicine / Trick / Trial implementation path
- one campfire reflection flow

### Build First in UE5

**Scene / Arena:**
- one Northern Forest combat bowl with 2-3 strong landmarks
- one campfire edge space for prep and reflection
- one encounter arena that supports circling, anchoring, and visibility shifts

**Player:**
- light attack
- heavy attack
- dodge step
- sidestep
- brace
- 3 response actions mapped to Medicine / Trick / Trial
- Presence resource and one basic recovery rule

**Enemy:**
- Wendigo as first full boss
- clear call states
- phase transition at 40% HP
- fear pressure and convergence behavior
- at least one attack that wants bracing, one that wants repositioning, and one that wants a ritual response

**Systems:**
- lock-on or soft-target support
- readable enemy telegraphs
- simple codex/log note after fight
- one harvest interaction
- one campfire between attempts

### Prototype Success Criteria

The first UE5 slice succeeds if it proves:
1. the combat is readable at a glance
2. Presence changes player behavior meaningfully
3. Medicine / Trick / Trial feels like a real combat language
4. the boss feels like a story-shaped duel, not an HP sponge
5. the N64-ish presentation direction improves clarity instead of feeling cheap

### Later Expansion

After the first slice works, expand into:
- more biomes
- more bosses with different response emphases
- lineage differentiation
- story thread persistence
- richer campfire / keeper's fire structure

---

## 11. MVP Demo Design

### Demo Title: "First Hunt — The Wendigo at Frozen Creek"

**Engine target:** UE5 prototype first
**Biome:** Northern Forest (winter)
**Monster:** Wendigo
**Expected session time:** 5-10 minutes
**Recommended first weapon:** Spirit Lance

---

### Demo Goals

This demo is not trying to prove the entire roguelike. It is trying to prove the combat identity.

The player should leave understanding:
- this is a readable mythic duel
- the Seeker wins by correct response, not mashing
- Presence matters
- the boss is telling a story through behavior

### Arena Layout

The arena should be compact and memorable:
- campfire entrance edge
- frozen creek crossing
- tree-line pressure zone
- one grounding landmark, such as a stone rise or deadfall
- one dangerous low-visibility zone used during phase 2

This should feel like an N64 boss arena in clarity, with modern polish on top.

### Demo Flow

**00:00 to 01:00, Preparation and Approach**
- player starts at campfire
- short line or environmental clue establishes that something is wrong
- tutorialized but light interaction with Presence, brace, and Spirit Sight equivalent
- footprints and frost signs lead forward

**01:00 to 02:00, Interpretation Phase**
- Wendigo is seen only partially at first
- player gets one or two safe chances to read posture and distance behavior
- one clear tutorial prompt teaches the idea of Call and Response

**02:00 to 05:00, Phase 1 Combat**
- convergence walk teaches dodge vs sidestep spacing
- hunger pressure teaches Presence loss and grounding
- one attack is best answered with brace
- one punish window teaches counter strike timing

**05:00 to 07:00, Phase 2 Shift**
- whiteout or blizzard activates
- Wendigo grows more aggressive
- arena readability changes but does not collapse into visual sludge
- player must use learned response language, not just raw reaction speed

**07:00 to End, Resolution**
- kill, retreat, or clean partial success all count as meaningful outcomes for prototype purposes
- short harvest interaction
- codex or story-thread note unlock
- return to campfire reflection beat

### What the demo proves

1. readable encounter-first combat
2. Presence as a real behavior-shaping resource
3. Medicine / Trick / Trial as the game's combat grammar
4. N64-ish clarity as a strength, not a compromise
5. Thunderwalker as something meaningfully different from Soulslike combat and card battlers
