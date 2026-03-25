# IMAGINE — Game Design Document
### *A Suite of Exercise Games About Eternal Struggle*

**Version:** 0.2 (Exercise Science Revision)
**Author:** James Sypherd
**Date:** 2026-03-25
**Engine:** Unity
**Status:** Pre-Production

---

> *"The struggle itself toward the heights is enough to fill a man's heart.
> One must imagine Sisyphus happy."*
> — Albert Camus, *The Myth of Sisyphus*, 1942

---

> *"The boulder gets heavier because he gets stronger. That's not tragedy.
> That's progressive overload."*
> — Design principle, Imagine v0.2

---

## Table of Contents

1. [Vision & Elevator Pitch](#1-vision--elevator-pitch)
2. [Game Suite Overview](#2-game-suite-overview)
3. [Core Mechanics](#3-core-mechanics)
4. [Narrative & Atmosphere](#4-narrative--atmosphere)
5. [The Boulder System](#5-the-boulder-system)
6. [Social & Competitive Layer](#6-social--competitive-layer)
7. [Technical Specification](#7-technical-specification)
8. [Monetization](#8-monetization)
9. [Development Roadmap](#9-development-roadmap)
10. [Why This Is Special](#10-why-this-is-special)

---

## 1. Vision & Elevator Pitch

### What Is Imagine?

**Imagine** is a suite of three interconnected exercise games built in Unity, where your real-world physical output — rowing, cycling, lifting — is the only input. You play as Sisyphus. Your body is the controller. Stop moving and the world moves against you.

There is no pause button. There is no cheat code. There is no "light mode."

This is not a fitness app with game elements. It's an art game that demands physical effort as the price of admission. The fitness is a side effect of taking it seriously. The philosophy is the core design.

### Why Sisyphus?

Because Sisyphus is the only honest metaphor for exercise.

You climb. You descend. You climb again. The summit is not the point — Camus told us that in 1942. The *struggle toward the heights* is enough. Every workout is Sisyphus. Every rest day, the boulder rolls back. Every person who has ever trained for something and then gotten injured, or busy, or scared, knows this myth intimately. They just didn't have a name for it.

**Imagine** names it. And then it makes you do it anyway.

But here's what Camus didn't say, and what exercise science confirms: **the boulder gets heavier because Sisyphus gets stronger.** That's not tragedy layered on tragedy — that's progressive overload. The myth and the physiology are the same story. His punishment is a training program. Every session is a working set. The mountain is the weight stack. The regression between sessions is detraining. The plateau is adaptation demanding a heavier boulder.

This is not a metaphor. This is the mechanism.

The design premise: if the metaphor is honest, the game teaches something true. When your boulder rolls back because you stopped rowing, you understand — viscerally, in your body — what it means to lose progress. You don't need a tooltip. You *feel* it. That feeling is the lesson. Keep going anyway.

### The Getting Over It DNA

**Getting Over It with Bennett Foddy** (2017) established a template that almost no one has followed:

- Brutal, intentionally frustrating progression
- No checkpoints (or checkpoints so sparse they feel like cruelty)
- A philosophical narrator who reflects on your failure without mocking it
- A core mechanic that rewards mastery but punishes inattention
- The game *means something* — it's not just hard, it's *about* hardness

**Imagine** inherits all of this. But it diverges in one critical way:

Getting Over It is a game that *simulates* struggle. Imagine is a game that *is* struggle. The frustration isn't virtual. The sweat is real. You can't alt-tab your way out of the burn in your legs. The metaphor isn't layered on top of the experience — it *is* the experience.

Where Getting Over It asks: *"Can you tolerate losing progress?"*
Imagine asks: *"Can you keep moving even when it stops being fun?"*

The answer, every time you finish a session, is: yes. You can. You just proved it.

---

## 2. Game Suite Overview

The suite consists of three modes, each tied to a specific category of exercise equipment. Each mode is a distinct game with its own visual identity and mechanics, united by the Sisyphean theme and the shared Boulder System. All three modes share a universal Heart Rate Zone layer when a BLE heart rate monitor is connected.

---

### Mode 1: THE CLIMB
*For Rowing Machines (Concept 2 RowErg / BikeErg)*

**The premise:** Sisyphus rows a small stone boat up a vast mythological river — the Styx, the Alpheios, something unnamed — against a current that never stops. The mountain is ahead. The river flows against him. If he stops rowing, the current takes him back.

**Exercise science foundation:** Aerobic base building (Zone 2) for sustained sessions. Interval protocols (Tabata, 2:1 work:rest) for high-intensity content zones. VO2 max improvement is the long-term physiological adaptation — and the game's meta-progression reflects it directly.

**Visual identity:** Dark water, torchlight on cliff faces, ancient Greek geometric patterns etched into stone walls that slide past. Painterly, textured, like a Romantic oil painting in motion. The mountain looms above, impossibly high, perpetually fog-capped.

**Core gameplay loop:**
- **Stroke rate (SPM) + drive power (watts) = boat velocity.** Both matter. High SPM with weak drive is inefficient. Low SPM with powerful drive is sustainable but slow. The sweet spot rewards proper form.
- The rowing stroke has two phases, and the game knows which you're in:
  - **Drive:** Legs extend first → back opens → arms pull. This is where power is generated.
  - **Recovery:** Arms extend first → body rocks forward → legs compress. This is controlled deceleration.
  - A smooth power curve through the drive (gradual build, not a yank) earns a **Form Bonus** multiplier — briefly accelerates the boat. A sloppy spike-and-dump stroke loses it.
- Stop rowing completely → the current takes you. Fast. Faster than you climbed.
- Distance is measured in meters, displayed as altitude gain on the mountain face.

**Terrain zones and their training demands:**
- **The Gorge (0–500m):** Narrow channel, forgiving current. Zone 2 effort (60–70% max HR) is sufficient to hold ground and climb. The narrator speaks. This is where you find your aerobic base. *Game tells you: settle in, find your pace, this is a long river.*
- **The Open Water (500–2000m):** Current intensifies. Holding position now requires Zone 2–3 effort. SPM matters more — sub-18 SPM risks drift regardless of drive power. This zone rewards consistent stroke rate over raw output.
- **The Cascade (2000–5000m):** Waterfalls fight you. Eddy currents require rhythm to navigate. The game begins issuing **Interval Demands** — 20-second surge windows where the current doubles. Zone 4 effort required to advance during surges. Zone 2 between them. This is Tabata logic built into the terrain.
- **The Final Ascent (5000m+):** The mountain becomes vertical. The river becomes a cascade. The boat feels heavier. This zone has no ceiling. Sustained Zone 4–5 effort required just to hold ground. Zone 2 advances you slowly. This is the VO2 max zone. The game knows it. The narrator knows it.

**Interval Demands (The Cascade and beyond):**
- Triggered by environmental events (waterfall approach, eddy, surge)
- Structure follows proven interval protocols:
  - **Tabata Surge:** 20 seconds max effort / 10 seconds reduced current (repeat 8x = 4 minutes). Visual: the waterfall lights up.
  - **2:1 Intervals:** 40 seconds at Zone 4 / 20 seconds at Zone 2. Visual: the current pulses.
  - **Pyramid:** Surge windows grow (10s / 20s / 30s / 20s / 10s) then shrink. Visual: the cliff narrows.
- Players who stay in Zone 2 during surge windows make no progress or drift. The game doesn't punish — it just reflects physics.

**Session mechanics:**
- Each session starts at your last persistent position minus a regression offset.
- The regression offset scales with days away, not just hours (see Section 3.2).
- Mid-session rest of >10 seconds = slow drift back.
- You earn Session Altitude (resets each session) and Lifetime Altitude (permanent).

**Checkpoints:** Three total, at 500m, 2000m, and 5000m. Unlocking one is permanent. Stone markers etched with your name and the date you passed.

---

### Mode 2: THE SUMMIT
*For Exercise Bikes / Spin Bikes (ANT+/BLE cadence + power sensors)*

**The premise:** Sisyphus pedals a loaded cart up an endless mountain road. The boulder is in the cart. He cannot stop. The road behind him is a slope. Stop pedaling and he rolls back.

**Exercise science foundation:** Power-based training using FTP (Functional Threshold Power) as the calibration anchor. Zone 2 for base building. HIIT protocols for hard content zones. Cadence × resistance = power — both variables matter and the game tracks both independently.

**Visual identity:** Mediterranean mountain pass at various times of day. The light shifts with session duration — you start at dawn, you climb into golden afternoon, you might hit dusk if you're pushing hard. The road is hand-painted, impressionistic. The mountain never peaks.

**Core gameplay loop:**
- **Power output (watts) = climbing rate.** Watts = cadence × resistance (torque). The game accepts both from a power meter directly, or estimates from cadence + resistance setting.
- **Cadence sweet spot: 85–95 RPM.** Below 80 RPM at high resistance = strength-endurance work (slow, grinding, expensive metabolically). Above 100 RPM at low resistance = spin-out (inefficient, minimal forward progress). The mountain rewards efficiency.
- **Resistance = gradient.** Higher gradient = harder to hold position at any given cadence. This maps directly to real resistance settings on smart trainers (FTMS) or is reported manually by the player.
- Drop below minimum cadence for your current gradient → cart rolls back (gravity is honest).
- Stop completely → the cart accelerates downward.

**FTP and Power Zones:**
Before a player's first Summit session, the game offers an **FTP Test Protocol** — a structured 20-minute effort. The game guides the player through the protocol, records average power, and sets their FTP at 95% of that average. All zones are then calculated as percentages of FTP.

If FTP test is skipped, zones default to RPE (Rate of Perceived Exertion) estimation until a test is completed. The narrator will ask about this.

| Zone | Name | % FTP | Feel | Game Effect |
|------|------|--------|------|-------------|
| Z1 | Recovery | <55% | Conversational | Drift zone. Barely holding ground. |
| Z2 | Aerobic | 56–75% | Comfortable, sustainable | Climbing. Zone 2 is the foundation. |
| Z3 | Tempo | 76–90% | Noticeably hard | Good progress. Sustainable for 20–60 min. |
| Z4 | Threshold | 91–105% | Very hard, limited duration | Rapid altitude gain. The mountain responds. |
| Z5 | VO2 Max | 106–120% | Near limit, 3–8 min max | The camera pulls back. The sky opens. The narrator goes quiet. |
| Z6–Z7 | Anaerobic/Neuro | >120% | All-out, seconds only | Reserved for sprint finishes and surge events. |

**Gradient system (maps to resistance):**
- **Flat Road (0–5%):** Z2 effort sufficient to climb. Cadence ≥ 85 RPM optimal.
- **Hairpin Climb (5–10%):** Z2–Z3 required. Cadence 80–90 RPM. The mountain is speaking.
- **The Wall (10–15%):** Z3–Z4 required to advance. Cadence 75–85 RPM. Lower cadence acceptable here — this is strength-endurance territory.
- **The Impossible Grade (15%+):** Z4–Z5 required. Cadence 70–80 RPM. High resistance × moderate cadence = maximum sustainable power. This is where FTP-tested players have a real edge.

**HIIT Protocol Zones (gradient events):**
- **30/30 Intervals:** 30s at Z5 / 30s at Z1–2. Triggered by sharp switchbacks on steep terrain.
- **40/20 Intervals:** 40s at Z4 / 20s at Z2. The standard hard climb format.
- **Tabata Climbs:** 20s max effort / 10s reduced gradient / × 8. Visual: summit briefly visible through clouds.
- Completing an interval series without dropping zone earns a **Trail Bonus** — temporary reduction in gradient for the next minute.

**Day/Night cycle:** A full "mountain day" is 90 minutes of ride time. Cross a day boundary and the landscape transforms — different lighting, different ambient sound, different narrator tone. Night riding feels lonelier. It should.

**Checkpoints:** None in The Summit. The only marker is altitude, and altitude is honest. You know where you are. You know where you were.

---

### Mode 3: THE BURDEN
*For Strength Machines (Rep counters, load cells, or manual input)*

**The premise:** Sisyphus carries the boulder. On foot. Up a path. Each step forward costs effort — not just reps, but *time under tension*. Each slow, controlled movement of the boulder moves him forward. Rush it, slam it, or cheat the range of motion — the boulder barely moves. The mountain recognizes the difference between effort and quality.

**Exercise science foundation:** High Intensity Training (HIT) per Arthur Jones and Doug McGuff's *Body by Science* protocol. One working set to momentary muscular failure. Slow, controlled tempo (4–6 seconds up / 4–6 seconds down). Time Under Tension (TUT) is the primary metric — not raw rep count. Progressive overload is the law: the boulder must get heavier over time, or adaptation stalls.

**Visual identity:** Close. Intimate. You see Sisyphus from the side, in silhouette most of the time, the boulder enormous against the sky. The ground is rough stone. The horizon is always another hill. Almost abstract. The weight is visible in the art.

**Core gameplay loop:**
- **Time Under Tension (TUT) = forward progress.** Each second of controlled movement under load moves Sisyphus forward. A sloppy 2-second rep earns 2 TUT. A controlled 10-second rep (4 up + 2 pause + 4 down) earns 10 TUT — and looks like it.
- **Tempo target: 4–6 seconds concentric (up/push/pull), 4–6 seconds eccentric (down/return).** A smooth, continuous movement. No bouncing. No momentum. No ego.
- **Rep quality gates (when load cell data is available):**
  - Full ROM (>85% of max): Full TUT credit
  - Partial ROM (50–85%): 50% TUT credit
  - Cheated rep (<50% ROM or explosive): 0 TUT credit + brief **Form Penalty** (Sisyphus stumbles, loses ground equivalent to 5 TUT)
- **Working set design:** One working set to momentary muscular failure. 8–12 slow reps = hypertrophy target. 3–5 very slow reps with heavier load = strength target. Both are valid. The game doesn't judge the weight — only the effort.
- Between sets: Sisyphus stands still, holding the boulder. Rest timer begins (minimum 2 minutes, 3 recommended).
- Drop the boulder before rest is complete: acceptable. The boulder rolls back proportionally to unspent TUT. This is not a failure — it's physics.
- New set: Sisyphus walks back to the boulder. The walk is your rest remainder. It is not skippable.

**Muscle Group Mapping — Unlock System:**
The game knows which exercise you're doing. Different muscle groups unlock different in-world abilities for Sisyphus:

| Machine / Exercise | Muscle Group | In-Game Ability Unlocked |
|---|---|---|
| Chest Press | Pectorals / Anterior Deltoid | Boulder Push — Sisyphus can push the boulder over obstacles on the path (clears route blockers) |
| Leg Press / Squat | Quads / Glutes / Hamstrings | Boulder Drive — explosive step-up over terrain rises; stairs cost less TUT |
| Seated Row / Deadlift | Lats / Rhomboids / Erectors | Boulder Carry — uphill path grade reduces in effect; back strength = better leverage |
| Overhead Press | Deltoids / Triceps | Boulder Lift — clears vertical obstacles; the boulder can be hoisted over walls |
| Lat Pulldown / Pull-up | Lats / Biceps | Boulder Swing — navigates angled paths; lateral terrain costs less |
| Leg Curl / RDL | Hamstrings | Path Grip — less rollback on steep descents between sets |

These abilities are session-specific — they activate based on what you trained in this session. The idea: your training history shapes what kind of Sisyphus you are right now. Leg day Sisyphus is different from push day Sisyphus. The boulder is the same. The man carrying it isn't.

**Progressive Overload Tracking:**
The game logs your TUT and load per exercise per session. If you've done the same load for 3 consecutive sessions without reaching failure in 8 reps, the game notifies you — through the narrator, not a popup:

> "The boulder hasn't changed weight in three sessions. You have. You know what that means."

Progressive overload is the law. The boulder gets heavier because you're ready for it to.

**Rest timer:**
- Minimum rest: 2 minutes (HIT recommendation). The game will not accept a new set before this.
- Recommended rest: 3 minutes (displayed as a visual fill on the path ahead).
- The between-set timer is visualized as Sisyphus standing on the path, breathing. The boulder sits. The path waits.
- At minimum rest: the path ahead subtly brightens. Sisyphus is ready.
- Starting a set before the timer completes is possible but earns a **Fatigue Penalty** — TUT credit reduced by 25% for that set. Accumulated fatigue means accumulated diminishing returns.

**Exercise types supported:**
- **Primary (full TUT tracking via load cell or manual tempo entry):** Chest press, leg press, seated row, overhead press, lat pulldown, leg curl, leg extension — all major machine exercises
- **Secondary (rep-counted with manual tempo):** Deadlifts, squats, bench press, pull-ups, lunges
- **Tertiary (manual rep logging, honor system):** Any other exercise. The game trusts you. Your physiology doesn't care if you cheated the input — only the adaptation matters.

**Checkpoints:** Yes, but HIT-aware. Sisyphus can set the boulder down at a checkpoint — ancient stone rests carved into the hillside. One per session. The checkpoint records the TUT accumulated to that point. When you return, the path continues from there — but the boulder has been reset to the weight you logged last session. The checkpoint doesn't freeze time. It just marks where the work was real.

---

## 3. Core Mechanics

### 3.1 Universal Heart Rate Zone Layer

**Heart rate is the universal truth across all three modes.** When a BLE Heart Rate Monitor is connected (Heart Rate Service UUID: 0x180D), the game gains a continuous window into the player's actual physiology. This is the deepest layer of the design.

**HR Zones (Karvonen formula, uses resting HR and age-estimated max HR):**

| Zone | % Max HR | Name | Effect in-game |
|------|----------|------|----------------|
| Z1 | <60% | Recovery | Drift rate reduced 20%. The body is barely stressed. The narrator notices. |
| Z2 | 60–70% | Aerobic Base | Standard progress rate. The sustainable zone. This is training. |
| Z3 | 71–80% | Aerobic Power | Progress rate +15%. You're working. The world knows. |
| Z4 | 81–90% | Threshold | Progress rate +30%. The narrator goes quieter. |
| Z5 | 91–100% | VO2 Max / Red Zone | Progress rate +50% but drift penalty if sustained too long (physiological warning system). Hard to hold. Not meant to be held. |

**HR Zone visual cue:** The world's color temperature shifts subtly with HR zone — cooler at Z1, warmer at Z5. Not aggressive — just present. The player feels the temperature of the world matching their effort.

**HR data also feeds:**
- EPOC tracking (Section 3.4)
- Overtraining detection (Section 3.6)
- Recovery recommendations
- The narrator's assessment of your effort

**When no HR monitor is connected:** Zones are estimated from output metrics (watts, SPM, cadence). Less accurate, but functional. The narrator will occasionally suggest connecting one.

### 3.2 Real-Time Hardware Sync

**Concept 2 PM5 (Rowing — The Climb):**
- Protocol: ErgData BLE or USB Serial
- Service UUID: `CE060030-43E5-11E4-916C-0800200C9A66` (Concept 2 proprietary)
- Data polled per stroke: Stroke rate (SPM), pace (500m split), power (watts), distance (meters), drive length (m), drive time (s), recovery time (s), stroke state
- Update rate: Per-stroke (~0.5–1Hz at moderate intensity)
- **Drive quality metric:** Drive time / stroke cycle time = drive ratio. Healthy ratio: 1:2 (drive is half the stroke cycle). Ratios outside 1:1.5 to 1:3 flag form issues.
- Fallback: Manual pace entry for older PM models

**ANT+ / BLE Sensors (Cycling — The Summit):**
- Protocol A: ANT+ via USB dongle (Garmin Dynastream ANT+ stick)
- Protocol B: BLE Cycling Power Service (UUID: 0x1818) — standard, most modern power meters
- Protocol C: BLE Cycling Speed and Cadence (UUID: 0x1816) — cadence only
- Data: Cadence (RPM), power (watts if available), speed
- FTMS (Fitness Machine Service, UUID: 0x1826): bidirectional — allows Unity to *set* resistance on compatible smart trainers (Wahoo KICKR, Tacx NEO, etc.). Enables auto-gradient in v2.0.

**Heart Rate Monitor (All Modes):**
- Protocol: BLE Heart Rate Service (UUID: 0x180D)
- Characteristic: Heart Rate Measurement (UUID: 0x2A37)
- Data: Heart rate (BPM), RR interval (if available — enables HRV tracking for recovery scoring)
- Compatible with: Any standard BLE HRM (Polar H10, Wahoo TICKR, Garmin HRM-Pro, chest straps, arm bands)
- The HR monitor is the only sensor that spans all three modes. It is the universal language.

**Strength Machines (The Burden):**
- Option A: **Smart machines with BLE output** (Keiser M-series — BLE proprietary, per-machine integration)
- Option B: **Smart barbell collar / sensor** (Vmaxpro, Weller — BLE; provides velocity, ROM, rep count)
- Option C: **Phone camera rep detection** (ML pose estimation via Unity Barracuda — counts reps and estimates ROM from video)
- Option D: **Manual input** — user enters reps and perceived tempo at end of each set. Ships in MVP. Fully functional. The honor system, as intended.
- **Tempo input (manual mode):** Player selects their tempo from a radial: Explosive / Moderate / Controlled (4-4) / Very Slow (6-6). TUT is calculated from tempo × reps. The game trusts the input. The adaptation is your responsibility.

**Hardware Abstraction Layer:**
- Unity plugin layer: `IExerciseDevice` interface, one implementation per hardware type
- Mock implementations for development/testing without hardware
- Connection UI: Minimal. Scan → pair → go. Not a settings menu — a pre-game ritual.

### 3.3 Progress / Regression System

This is the spine of the design. Everything else serves this.

**The Drift (mid-session):**
- At rest (no input detected): Sisyphus drifts backward at a base rate
- Base drift rate: 1 unit/second (tuned per mode)
- Drift acceleration: Increases the longer you rest (exponential up to a cap)
- Maximum drift: ~3× base rate after 30 seconds of inactivity
- Drift cap: Cannot lose more than one "zone" in a single rest period
- **HR-modified drift:** If HR monitor is connected and heart rate is still in Z3+, drift rate is reduced 30% (your body is still working even if the machine isn't moving — EPOC is real).

**The Regression Offset (Between Sessions):**
- Offline time: Every day away costs a regression, modeled on real detraining curves
- Formula: `regression = base_rate × log(days_offline + 1)`
- This is intentionally gentle but never zero. You can't bank progress indefinitely.
- **Recovery days:** A single rest day (1 day offline) applies *minimal* regression — less than the formula alone would suggest. This reflects real recovery science: one rest day is not detraining, it's adaptation. The game rewards this.
- **Overtraining modifier:** If the game detects consecutive high-intensity sessions without recovery days, regression is *increased* on the following rest day. You can train too hard. Sisyphus knows this.
- Visual: When you launch and connect, the game shows you exactly where you are. No hiding it.

**Why This Works:**
- The regression is not punishment. It's honesty.
- Your cardiovascular fitness doesn't hold perfectly between sessions. Neither does Sisyphus.
- Players who train consistently with appropriate recovery experience *less* regression — mirroring the real-world benefit of consistent training + rest.

### 3.4 EPOC — The Afterburn

**Excess Post-exercise Oxygen Consumption** — the physiological reality that hard sessions keep your metabolism elevated for hours afterward — has a direct in-game equivalent.

**Mechanic:** After completing a session, the game calculates an **EPOC Score** based on session intensity (average HR zone, total time in Z4–Z5, interval completion). This score converts into **Afterburn Duration** — a period where the regression offset for this mode is suspended.

| Session Type | Afterburn Duration |
|---|---|
| Zone 2 base (45–90 min) | 4 hours of reduced regression |
| Threshold intervals (Z4, 20–40 min) | 8 hours of suspended regression |
| VO2 Max / HIIT (Z5, 15–25 min) | 12–16 hours of suspended regression |
| HIT strength session (TUT to failure) | 24–48 hours (muscle repair window) |

**Visual:** The boulder glows faintly after a hard session. Not pride — heat. The biological aftermath of real work. It fades as Afterburn expires. When it goes cold, the regression clock resumes.

The narrator acknowledges it:
> "The work doesn't end when you stop moving. Your body is still paying the debt. Rest. But know — the boulder is still warm."

### 3.5 Checkpoint Philosophy

**The Climb:** Three checkpoints. Permanent. Sparse. Sacred.
**The Summit:** None. Altitude is your only record.
**The Burden:** One per session, used manually. Records your TUT total and current load.

Checkpoints are not respawn points. They are records. They say: *you were here.* They don't soften the fall when you slide back — they just confirm you reached that height once. That matters.

The game never lies to you about where you are. There's a difference between where you've *been* and where you *are*. The checkpoints mark the former. The boulder marks the latter.

### 3.6 Periodization — The Meta-Game Training Blocks

This is the long game. Real training follows cycles. Imagine does too.

**Training Blocks (meta-progression layer):**

The game tracks rolling 4-week windows and classifies them automatically based on session data:

| Block | Duration | Characteristics | Game Effect |
|---|---|---|---|
| **Base** | 4–6 weeks | Predominantly Z2, consistent frequency | Regression rate decreases. Aerobic foundation builds. Terrain opens. |
| **Build** | 4 weeks | Mix of Z2 and Z4 intervals, progressive overload in The Burden | New terrain zones unlock. Interval demands intensify. |
| **Peak** | 2 weeks | High intensity, lower volume | Maximum game progress rate. Personal bests are most likely here. The narrator is different — focused, spare. |
| **Recovery** | 1 week | Low intensity, Z1–Z2 only | Regression is minimal. EPOC bonuses persist. **Rest days are rewarded** — each rest day in the recovery week extends Afterburn. The narrator honors this. |

**The game does not force you into a periodization structure.** It reflects the one you're actually following. If you go all-out every session with no recovery, the game will show you the consequences — increasing drift penalties, diminishing progress returns, and eventually a narrator line that isn't angry, just honest:

> "You've been pushing hard for three weeks without a recovery week. I notice that. Your body does too. The mountain isn't going anywhere. Neither is the work you've already done. Rest isn't retreat — it's how the adaptation finishes."

**Overtraining Detection:**
Triggered when the last 7 days show: 5+ sessions with avg HR ≥ Z4, no rest days, declining performance (TUT decreasing in The Burden, altitude-per-session decreasing in The Climb/Summit). The game does not lock you out — it warns you, through the narrator, once. Then it watches.

### 3.7 Death / Failure States

There is no death in Imagine. Death would be a mercy.

Instead:
- **Drift**: You slide back. You haven't failed. You've paused.
- **Regression**: Between sessions, you lose ground. You haven't quit. You've rested.
- **Form Penalty** (The Burden): A sloppy rep costs ground. Not a punishment — a mirror.
- **Drop** (The Burden): The boulder rolls back. You walk to it. You pick it up.
- **Session End**: Your Lifetime Progress is saved. You are never at zero.

The only true failure is quitting the game without logging out properly — which triggers a larger regression penalty. The game considers this a dropped boulder, not a graceful set. It is correct to do so.

### 3.8 Session vs. Persistent Progress

**Session Progress:**
- Tracked locally per session
- Shows: distance/altitude this session, TUT this session, time active, average HR zone, EPOC score
- Resets on new session launch
- Displayed at session end with full breakdown

**Persistent Progress:**
- Lifetime Altitude (per mode), Lifetime TUT, Total Session Hours, VO2 Max Estimate (rolling, from HR + power data)
- Stored locally + optional cloud sync
- The boulder's appearance reflects persistent progress (see Section 5)
- Leaderboards pull from Lifetime stats (see Section 6)

**No prestige resets.** There is no reason to erase what you've done. Sisyphus doesn't get a fresh start. Neither do you. The mountain is the same mountain. The boulder is the same boulder. It's heavier now — because you made it heavier. That's the point.

---

## 4. Narrative & Atmosphere

### 4.1 Sisyphus as Player Character

Sisyphus is rendered in a painterly, semi-abstract style — recognizably human, but timeless. No face (or a face you can barely see). Clothing: ancient, worn, practical. He does not speak. He does not emote in a readable way. He just works.

He is you. His body language is your effort. At low intensity he moves economically. At high intensity he strains. At rest he waits — and the boulder begins to move. He doesn't look afraid. He looks like he's done this before. He has.

His physical form evolves subtly with training history:
- Long-term rowers: Sisyphus's posture improves. His stroke looks smoother.
- Long-term cyclists: His climbing form tightens. His cadence looks efficient.
- Long-term lifters: He carries the boulder with better mechanics. The leverage is visible.

This is cosmetic, not mechanical. But it's honest. The game shows you what you've been practicing.

**Customization:** Cosmetic only. Cloth color, skin tone, silhouette options. No power upgrades. No skill trees. You don't make Sisyphus stronger — *you* get stronger, and the game knows.

### 4.2 The Narrator

The narrator is the design's most dangerous element and its most important one.

He should be:
- **Brilliant** — every line earns its existence
- **Philosophical** — genuinely engaging with ideas, not just quoting them
- **Insufferable** — right in a way that feels personal
- **Kind, in the cruelest possible way** — he never insults you, he just *sees* you
- **Scientifically literate** — he knows the difference between fatigue and quitting. He knows what EPOC is. He will not tell you to "push through the pain" without acknowledging that some pain means stop.

The narrator speaks:
- When you start a session (welcome back, with memory of your absence)
- When you pass a checkpoint
- When you fall significantly
- When you hit a personal best
- When you've been resting too long
- When your form degrades (The Burden)
- When you complete an interval series
- When you're in an overtraining pattern
- When you take a proper recovery day
- When you quit

He does not speak constantly. Silence is his most powerful tool. When he does speak, it matters.

**The Narrator's Rules:**
1. Never tells you what to do — only what is happening or what is possible
2. Never lies — if the situation is bad, he acknowledges it honestly
3. Never mocks — he empathizes, even when empathy is brutal
4. Is never surprised — he's seen this a thousand times, and so have you
5. **Never advocates broscience** — no "no pain no gain," no "push through it," no glorification of injury. Soreness is adaptation. Sharp pain is a signal. The narrator knows the difference and treats it seriously.
6. Respects recovery — rest days are not weakness. The narrator says so.

**Sample Narrator Lines:**

*On starting a session after a long absence:*
> "You're back. The mountain didn't go anywhere. Neither did I. You've lost a little ground — that's honest, not punishing. Your body was doing what bodies do when the work stops. Let's find out what it still remembers."

*On a significant fall in The Climb:*
> "You know, there's a tempting narrative where that fall means something — a setback, a lesson, a dramatic reversal. I think it just means the interval was harder than your current aerobic base could sustain. That's information. Settle into Zone 2. Build the engine first. The cascade will still be there."

*On reaching a personal best:*
> "Higher than you've ever been. The view up here is — well. You can see that for yourself. I don't need to describe it. Don't stop."

*On resting too long mid-session:*
> "The current doesn't wait. I know you're tired. And I want to be precise: if this is cardiovascular fatigue, you can keep going at a lower zone — the body is more resilient than it feels right now. If something hurts, that's different. That's worth listening to. The mountain respects the difference. So do I."

*On quitting:*
> "You can come back. Sisyphus always comes back. That's the whole point. ...See you tomorrow."

*On failure in The Burden — sloppy rep:*
> "You felt that, didn't you. The weight moved, but you moved it wrong — momentum did the work, not your muscles. The boulder knows. Go back. Slower this time. The tempo is the point. Four seconds up. Four seconds down. The seconds are where the adaptation lives."

*On completing a full HIT set to failure:*
> "That's what momentary muscular failure looks like. The last rep you couldn't complete — that's the rep that matters. Everything before it was the price of admission. Rest now. Two minutes minimum. The muscle needs it."

*On a proper recovery day:*
> "You didn't train today. I know. The boulder moved back, a little — you've seen it. But something else happened today that doesn't show on this screen: your muscle fibers repaired. Your cardiovascular system consolidated the adaptation from yesterday. The work you did two days ago is more yours today than it was when you did it. Rest isn't retreat. It's where the mountain is actually built."

*On overtraining detection:*
> "Five sessions this week. All hard. I've been watching, and I'll tell you what I see: your numbers are going the wrong direction. More effort, less progress. That's not motivation needing fixing. That's physiology. You've outrun your recovery. One hard truth: the next session isn't going to help. A rest day will. I know that's not what you want to hear. I'm telling you anyway."

*On FTP test completion:*
> "Now the mountain knows your threshold. Everything from here is calibrated — the zones aren't guesses anymore, they're yours. Zone 2 is your foundation. Zone 4 is your edge. Zone 5 is the summit of what you can currently sustain. All of that will change. That's the whole point."

*On progressive overload prompt in The Burden:*
> "The boulder hasn't changed weight in three sessions. You have. Your muscles adapted to this load three weeks ago — you've just been confirming what you already know. You know what this means. The boulder gets heavier because you're ready. That's not punishment. That's the definition of progress."

*Philosophical interlude (rare, long rest):*
> "Camus said one must imagine Sisyphus happy. I spent a long time thinking that was cope — a way to make meaningless suffering feel bearable. But I think he was pointing at the mechanics of it. Sisyphus carries the boulder. The boulder gets heavier because he gets stronger. The hill gets longer because his legs can handle more. He's not trapped in futility. He's in the middle of the best training program ever designed, with no choice but to follow it perfectly. The gods didn't condemn him. They gave him progressive overload and infinite volume. The only question is whether he knows it."

### 4.3 Visual Style

**Palette:** Mediterranean — ochre, terracotta, deep blue water, white stone. At higher altitudes: violet sky, gold light, mist. At night: deep indigo, torch-orange, shadow.

**Art direction:** Oil painting in motion. Not pixel art. Not cel shading. Think a dynamic painting — brushstroke textures, slightly impressionistic edges, but enough clarity to read the action.

**Camera:** Mostly static or slow-panning. The mountain moves past Sisyphus, not the other way around. This is intentional — it feels like a treadmill, because it *is* a treadmill, and that honesty should be in the camera work too.

**UI:** Minimal. Core metrics displayed small, at edges:
- **The Climb:** Split time (/500m), current SPM, watts, session altitude. HR zone indicator (subtle pulse at screen edge, color-coded).
- **The Summit:** Current power (% FTP), cadence (RPM), current gradient %, session altitude. HR zone indicator.
- **The Burden:** TUT counter (current set, cumulative session), rest timer, load logged. HR zone indicator.
- Heart rate (if connected): Always visible, subtle. The body is always speaking. The UI should always be listening.
- Nothing else. The narrator handles feedback. The world handles atmosphere.

**No loading screens.** The game transitions between effort states seamlessly.

### 4.4 Sound Design

**Philosophy:** The soundtrack should be physically responsive. It should feel like the world is listening to your body.

**At rest / low effort (Z1):**
- Ambient: water, wind, stone, distant birds
- No music. Sound design fills the space.
- The boulder makes subtle settling sounds.

**At moderate effort (Z2–Z3):**
- A single melodic instrument enters — oud, lyre, something Mediterranean and ancient
- Tempo loosely tracks your stroke rate or cadence (felt, not explicit BPM sync)

**At high effort (Z4):**
- Percussion layers in. The melody intensifies.
- Something propulsive, something earned.

**At peak (Z5):**
- The full score, spare but driving. This is reserved for moments that matter.
- At sustained personal-best pace: brief musical swell — not triumphant, more like *recognition.*

**Sound FX:**
- Rowing: water, oar catches, boat hull, your breath — the catch is clean, the finish is full, the recovery is quiet
- Cycling: chain, road surface, wind speed scaling with pace
- Lifting: equipment sounds, controlled effort, breath — no slamming, no crashing. Controlled loads sound controlled.

**The boulder's sound:** The boulder has its own acoustic presence. When it moves with you, it hums — a low, resonant tone that shifts in pitch with load. When it rolls back, that tone deepens and fades. When the EPOC glow is active, it runs warmer. You feel its thermal presence.

---

## 5. The Boulder System

### 5.1 The Boulder as Progress Bar

The boulder is not a metaphor in Imagine. It is a progress bar that happens to look like a boulder.

Its visual properties change with your Lifetime Progress:
- **Size:** Grows slowly with accumulated lifetime TUT, altitude, and session hours. A new player's boulder is modest. A veteran's is enormous.
- **Texture:** Starts rough, raw stone. As progress accumulates, the surface develops — lichen, mineral veins, polish from handling. The boulder has been carried so many times it shows it. Specific vein patterns emerge with specific milestone types: metallic striations for strength milestones, watermark patterns for cardio milestones.
- **Glow:** Active during EPOC window — faint inner heat. Dies when Afterburn expires. Returns after the next hard session.
- **Weight inscription:** Optional. Carve a word or short phrase into the boulder. It stays.

### 5.2 Cosmetic Customization

**Your burden is your own.** All cosmetic, all personal, none of it affects mechanics.

Available customizations:
- **Stone type:** Granite, marble, volcanic basalt, sandstone, obsidian (milestone unlocks)
- **Markings:** Geometric patterns, personal sigil, tally marks (auto-generated from TUT milestones), session count hash marks
- **Color:** Natural stone tones only. The boulder is not a toy.
- **Boulder name:** Optional. One word or two.

Unlocks are earned through Lifetime Progress milestones — not purchased.

### 5.3 Shared Boulders — Co-Op

**Co-op is not matchmaking. Co-op is a pact.**

Two players can link sessions and share a boulder. When both are active, the boulder moves faster. When one stops, the drift slows (but doesn't stop). When both stop, the drift is severe.

**Co-op rules:**
- Maximum 2 players per boulder
- Both must use the same mode
- If one player is in a recovery session (Z1–Z2) and the other is pushing hard (Z4–Z5), the combined boulder moves at the average — honest, not punishing
- If one player quits mid-session, their drift penalty applies to the shared boulder. Accountability is the mechanic.

**Why co-op is limited to 2:**
Two people share a boulder. That's the myth. A crowd carrying a boulder isn't Sisyphus — it's a moving company.

---

## 6. Social & Competitive Layer

### 6.1 Leaderboards

**No engagement metrics. No algorithmic manipulation. Just honest numbers.**

Leaderboard categories:
- **Lifetime Altitude** (The Climb, The Summit) — total meters gained, ever
- **Lifetime Burden** (The Burden) — total TUT × average load, converted to a single Burden Score
- **Session Records** — highest altitude in a single session, highest TUT in a session
- **Consistency Streak** — sessions per week, tracked over 90-day windows (rewards showing up, not suffering)
- **Recovery Intelligence** — a new metric: ratio of hard sessions to recovery sessions, over 90 days. The player closest to optimal periodization (roughly 80% Z2 / 20% Z4–5) earns a visible mark. Not a leaderboard position — a badge. A signal that they train smart.

**Privacy:** All stats opt-in for public leaderboard. Default: local only.

### 6.2 "Witness My Struggle" — Spectator Mode

You can share a live view of your session. The spectator sees:
- Sisyphus in motion (or at rest — the game doesn't lie)
- Your boulder, with accumulated visual history
- Current altitude/distance (this session and lifetime)
- HR zone indicator (color only — no raw BPM by default, respects privacy)
- EPOC glow state (was this a hard session? the boulder says so)
- The narrator's commentary

**Stream integration:**
- OBS-compatible overlay: altitude, session time, HR zone, current metric (SPM/watts/TUT)
- Twitch/YouTube chat commands: `!altitude`, `!boulder`, `!zone`, `!howlonghashebeenresting`
- Stream-triggered narrator lines: chat can vote for narrator category (philosophical / observational / encouraging). One vote per 15 minutes.

### 6.3 Ghost Mode

**Race your previous self.**

When you launch a session, you can opt to see a Ghost — a translucent replay of your best equivalent session from the last 30 days. Not your all-time best. The 30-day Ghost is achievable. The all-time best is history.

The Ghost moves at the output pace you once held. If you're ahead: good. If you're behind: you know what you're capable of.

The Ghost also reflects your HR zone from that session — you can see if past-you was working harder or smarter to achieve the same output. That's information.

---

## 7. Technical Specification

### 7.1 Unity Version

**Unity 6 LTS (6000.x)**
- Native BLE support (Unity Bluetooth LE package or third-party plugin)
- Strong PC/Mac/Linux build pipeline
- Meta XR SDK compatibility for Quest 3 (v2.0 target)
- HDRP for visual fidelity target

**Render Pipeline:** HDRP
- Volume-based post-processing for HR zone-reactive visual effects (color temperature shift)
- Note: HDRP on Quest 3 requires significant optimization — URP branch for VR

### 7.2 Concept 2 PM5 Integration (The Climb)

**Protocol options:**

*Option A — ErgData (BLE):*
- Service UUID: `CE060030-43E5-11E4-916C-0800200C9A66` (Concept 2 proprietary)
- Characteristics: rowing status, stroke data, additional status
- Data: stroke state, SPM, pace (/500m), power (watts), elapsed distance, drive length, drive time, recovery time
- Per-stroke update rate

*Option B — USB Serial (Windows) — recommended for MVP:*
- PM5 USB presents as virtual COM port
- Concept 2 PM5 Communications Interface Definition (public SDK)
- Simpler than BLE stack for PC-first development

**Data model (per stroke):**
```csharp
public struct RowingStrokeData {
    public float StrokesPerMinute;       // SPM
    public float PaceSecondsPer500m;     // /500m split
    public float PowerWatts;             // instantaneous power
    public float DistanceMeters;         // elapsed
    public float DriveLength;            // meters
    public float DriveTime;              // seconds (concentric phase)
    public float RecoveryTime;           // seconds (eccentric phase)
    public float DriveRatio;             // DriveTime / (DriveTime + RecoveryTime)
    public float PeakForceEstimate;      // if available from PM5
    public DateTime Timestamp;
}
```

**Form quality calculation:**
```csharp
// Healthy drive ratio: 0.33–0.40 (1:2 to 1:2.5 drive:recovery)
// Outside this range: FormBonusMultiplier = 0.0 (no bonus)
// Within range + smooth power curve: FormBonusMultiplier = 1.0–1.5
float formBonus = CalculateFormBonus(stroke.DriveRatio, stroke.PowerCurveSmoothing);
```

**Timeout handling:** No stroke data for 10 seconds → trigger drift state. No data for 60 seconds → prompt reconnect (non-blocking).

### 7.3 ANT+ / BLE Sensor Support (The Summit)

**ANT+ (via USB dongle):**
- Dynastream ANT+ managed library (.NET wrapper)
- Device profiles: Bicycle Speed and Cadence (BSC, type 0x79), Bicycle Power (type 0x0B)

**BLE (primary for v1.0):**
- Cycling Power Service: UUID **0x1818** — power (watts) + cadence
- Cycling Speed and Cadence: UUID **0x1816** — cadence only
- FTMS (Fitness Machine Service): UUID **0x1826** — bidirectional trainer control (v2.0)

**FTP Test Protocol (in-game guided):**
1. 10-minute warm-up (Z1–Z2, game guides pacing)
2. 5-minute all-out effort (establishes rough ceiling)
3. 5-minute easy recovery
4. 20-minute sustained maximal effort (player holds highest sustainable power)
5. Game records average watts over 20 minutes, sets FTP = 95% of that average
6. All zones calculated and stored. Narrator acknowledges the test completion.

**FTP Reassessment:** Prompted every 6 weeks or when the game detects consistent Z4 sessions becoming easier (output per HR unit improving). The narrator will suggest it; the player initiates.

**Data model:**
```csharp
public struct CyclingPowerData {
    public float PowerWatts;         // instantaneous
    public float CadenceRPM;
    public float NormalizedPower;    // rolling 30s average
    public float IntensityFactor;    // NP / FTP
    public float TSS;                // Training Stress Score (session accumulation)
    public int HRZone;               // 1-5, from HR monitor
    public DateTime Timestamp;
}
```

### 7.4 Heart Rate Monitor Integration (All Modes)

**BLE Heart Rate Service:** UUID **0x180D**
**Heart Rate Measurement Characteristic:** UUID **0x2A37**

**Data parsed:**
- Heart rate (BPM) — mandatory
- RR Interval (ms) — optional, when available (enables HRV-based recovery scoring)
- Energy Expended — optional (contributes to EPOC calculation)

**HR Zone Calculation:**
```csharp
// Karvonen formula: Target HR = ((Max HR - Resting HR) × %Intensity) + Resting HR
// Max HR estimated: 220 - age (configurable, or from field test)
// Player inputs resting HR and age during onboarding (or can skip for RPE mode)

public int GetHRZone(float currentHR, float maxHR, float restingHR) {
    float hrr = maxHR - restingHR;
    float percentHRR = (currentHR - restingHR) / hrr;
    if (percentHRR < 0.60f) return 1;       // Recovery
    if (percentHRR < 0.70f) return 2;       // Aerobic Base
    if (percentHRR < 0.80f) return 3;       // Aerobic Power
    if (percentHRR < 0.90f) return 4;       // Threshold
    return 5;                                // VO2 Max
}
```

**EPOC Score Calculation:**
```csharp
// Simplified EPOC estimate based on session HR zone distribution
float epocScore = (minutesInZ3 * 1.0f) + (minutesInZ4 * 2.5f) + (minutesInZ5 * 5.0f);
float afterburnHours = Mathf.Clamp(epocScore / 10f, 0f, 16f);
```

**HRV Recovery Score (when RR interval available):**
- Calculated as RMSSD (root mean square of successive differences) from RR intervals
- Compared to player's rolling 7-day baseline
- If HRV is suppressed >20% below baseline: recovery day recommended. Narrator notified.
- Displayed as a simple signal on session start screen: "Recovery: Good / Moderate / Low"

### 7.5 Strength Machine Support (The Burden)

**Priority order:**

1. **Manual rep logging + tempo selection** — MVP. Fully functional.
2. **Smart barbell collar / BLE velocity sensor** — Vmaxpro or Weller protocol. Real-time rep detection, velocity, ROM.
3. **Phone camera rep detection** — Unity Barracuda + pose estimation. Counts reps, estimates ROM from video feed.
4. **Smart machine BLE** — Keiser M-series and similar. Per-manufacturer integration.

**TUT Calculation:**
```csharp
public struct StrengthSetData {
    public float LoadKg;                // weight on machine/bar
    public int RepsCompleted;           // full ROM reps
    public int PartialReps;             // flagged as partial
    public float TempoSecondsUp;        // concentric phase
    public float TempoSecondsDown;      // eccentric phase
    public float TimeUnderTension;      // calculated: reps × (up + down)
    public bool ReachedMuscularFailure; // true if last rep was incomplete
    public MuscleGroup PrimaryMuscle;   // chest, legs, back, shoulders, etc.
    public float RestDurationSeconds;   // time before this set
    public DateTime Timestamp;
}

// TUT with tempo validation
float ValidateTUT(StrengthSetData set) {
    float rawTUT = set.RepsCompleted * (set.TempoSecondsUp + set.TempoSecondsDown);
    // Penalty for sub-3s concentric (explosive/sloppy)
    if (set.TempoSecondsUp < 3f) rawTUT *= 0.5f;
    // Bonus for reaching failure
    if (set.ReachedMuscularFailure) rawTUT *= 1.2f;
    return rawTUT;
}
```

**Rep validation (when automated):**
- Debounce: 300ms minimum between reps
- ROM check: require >70% of max ROM per rep or flag as partial
- Velocity gate: concentric velocity > 0.8 m/s = explosive flag (TUT penalty applied)
- Partial reps: 50% TUT credit (some lifters train intentional partials — configurable)

### 7.6 Target Platforms

**PC (Steam) — MVP and v1.0:**
- Windows 11 primary, Windows 10 supported
- MacOS Apple Silicon secondary
- Linux via Proton
- BLE via system adapter; USB serial for Concept 2

**Quest 3 (Meta VR) — v2.0:**
- The Climb VR: seated rowing with full immersive environment (proven viable — see Holodia/Ergatta)
- First-person perspective: you are Sisyphus, not watching him
- HDRP → URP conversion required
- Hand tracking for minimal UI interaction

**Console and Mobile:** See original v0.1 notes — position unchanged.

### 7.7 Data Architecture

**Local storage:** SQLite via Unity SQLite4Unity
- Session history, lifetime stats, personal bests, boulder customization, ghost data
- **New in v0.2:** FTP value, HR zones configuration, HRV baseline, periodization block tracking, EPOC log
- Human-readable export: CSV or JSON

**Cloud sync (v1.0):** Firebase or PlayFab
- Leaderboard data, lifetime stats, boulder appearance, FTP/zones (encrypted)
- No raw HR data sent to cloud without explicit opt-in

**Privacy:**
- All biometric data (HR, HRV, power) processed locally by default
- Cloud opt-in is per-stat, granular
- The game does not sell or share exercise data. Full stop.

---

## 8. Monetization

### 8.1 Core Pricing

**Premium purchase. One price. No subscriptions. No microtransactions.**

- **PC (Steam):** $29.99 USD
- **Quest 3:** $24.99 USD
- **Pricing philosophy:** This is a game, not a gym membership. Pay once. Play forever.

All three modes included. No starter edition. Sisyphus doesn't do trial runs.

### 8.2 DLC — The Mythological Expansion Pack(s)

**DLC 1: The Hunger — Tantalus Mode**
- *Myth:* Tantalus reaches for fruit that always recedes. Water that always drains.
- *Exercise:* Exercise bike. Interval training. The "fruit" (altitude target for each interval) retreats if you can't sustain the required power zone. Chase the FTP percentage. Interval targets set dynamically at 105% of your most recent zone achievement — always just beyond reach, until they're not.
- *Exercise science:* Pure HIIT progression. The game sets targets just outside current capacity — which is the definition of progressive overload for interval training.
- *Narrator:* Different voice. Hungry, longing, never satisfied with the gap between current and possible.

**DLC 2: The Wheel — Ixion Mode**
- *Myth:* Ixion bound to a spinning wheel of fire.
- *Exercise:* Rowing machine, but tempo-locked. Ixion's wheel spins at a target SPM. Deviate (above or below by >3 SPM) and the wheel burns him. Maintain exact tempo windows.
- *Exercise science:* Cadence-specific training. Controlled SPM ranges build specific neuromuscular and aerobic adaptations. This is a different kind of precision than power output — it's about rhythm, which rowing science confirms is as important as force.
- *Narrator:* Cold, clinical, precise. Counts deviations without emotion.

**DLC 3: The Flock — Prometheus Mode**
- *Myth:* Prometheus chained to a rock. Liver devoured daily, regrows nightly. He chose his fate.
- *Exercise:* Strength machines. Rest between sets is mandatory (timer-locked at 3 minutes minimum — no exceptions, no override). The mechanic rewards recovery as much as effort. The boulder regrows. So does the muscle.
- *Exercise science:* Extended rest protocols (3–5 minutes) maximizing strength expression — the neurological recovery, not just metabolic. The game enforces what the science recommends.
- *Narrator:* Defiant. Proud. This Prometheus knew what he was getting into. You did too.

**DLC Pricing:** $9.99 per DLC, $24.99 for all three.

### 8.3 What Will Never Be Sold

- Gameplay advantages of any kind
- Progress boosts
- Reduced regression penalties
- Skippable hard sections
- The ability to cheat Sisyphus

If anyone ever proposes a "Boost Pack" that reduces drift, refer them to this document. Then fire them.

---

## 9. Development Roadmap

### MVP — "The Climb" Alpha
**Target:** 6–8 months from greenlight
**Team:** 1–2 developers, 1 artist (contract)

**Scope:**
- The Climb only (rowing machine)
- Concept 2 PM5 via USB serial (Windows); BLE stretch goal
- Drive ratio form bonus system (basic version)
- Progress/regression system (core)
- HR monitor (BLE) integration — basic zone detection
- Narrator v1 — 50 lines, major moments only
- Basic boulder visual (size + glow only)
- No cloud sync, no leaderboards
- Visual style: 60% of target
- Ghost mode (local only)

**Definition of done:** A Concept 2 rower connects, rows for 30 minutes, experiences drift when resting, sees their altitude gained, gets a form bonus for a good stroke, and feels something. That feeling is the test.

**MVP deliverables:**
- [ ] PM5 USB serial connection + stroke data parsing (SPM, watts, pace, drive ratio)
- [ ] Movement model (TUT/stroke → boat → altitude)
- [ ] Drift system (rest → backward movement, HR-modified)
- [ ] HR monitor BLE (0x180D) — zone detection, basic color feedback
- [ ] Form bonus calculation (drive ratio gate)
- [ ] Session save/load (SQLite, local)
- [ ] Narrator audio: 50 lines recorded
- [ ] Boulder rendering (size + EPOC glow)
- [ ] EPOC score calculation + afterburn timer
- [ ] Terrain: The Gorge + Open Water zones
- [ ] Basic UI (altitude, SPM, watts, HR zone, session time)
- [ ] Menu (start, connect hardware, quit)

---

### v1.0 — Full Suite
**Target:** MVP + 10–12 months
**Team:** 2–3 developers, 1 full-time artist, part-time audio

**Scope:**
- All three modes (The Climb, The Summit, The Burden)
- BLE support for Concept 2 + ANT+/BLE for bikes
- FTP test protocol + zone calibration (The Summit)
- Manual TUT input for The Burden (smart hardware stretch)
- Muscle group unlock system (The Burden)
- Periodization block tracking (meta-game)
- Overtraining detection + narrator response
- Recovery day tracking + rewards
- HRV recovery score (when RR interval available)
- Narrator: 200+ lines, full arc, science-literate
- Boulder customization (stone type, markings, name)
- Cloud sync (Firebase)
- Global leaderboards including Recovery Intelligence metric
- Spectator mode + stream overlay
- Co-op (2-player shared boulder)
- Full visual style (all zones, HDRP)
- Steam release

**v1.0 milestones:**
- [ ] All three modes functional with target hardware
- [ ] HR monitor universal across all modes
- [ ] FTP test and zone system (The Summit)
- [ ] TUT system + muscle group mapping (The Burden)
- [ ] Progressive overload tracking + narrator prompts
- [ ] Periodization block engine
- [ ] Overtraining detection
- [ ] Recovery day rewards + EPOC persistence
- [ ] Boulder customization system
- [ ] Cloud sync + leaderboards
- [ ] Narrator: full 200+ line script recorded
- [ ] Co-op implementation
- [ ] Spectator mode
- [ ] Day/night cycle (The Summit)
- [ ] Full terrain for all zones
- [ ] Steam storefront + Steamworks integration

---

### v2.0 — Expansion
**Target:** v1.0 + 12 months

**Scope:**
- Quest 3 VR (The Climb VR, The Summit VR)
- FTMS trainer control (auto-gradient for smart trainers — resistance set by game)
- Smart barbell/collar sensor integration (The Burden — real-time TUT)
- HRV-based session recommendations (should you train hard today, or recover?)
- DLC 1: Tantalus Mode
- Phone camera rep detection
- Enhanced stream integration (Twitch extension)

**Definition of done:** Someone rows on a Concept 2 wearing a Quest 3, hits a Z4 interval surge, gets a form bonus for a clean catch, and hears the narrator go quiet because the moment doesn't need commentary.

---

### v3.0+ — Vision

- All three DLCs
- Community-created Sisyphean challenges
- Academic research partnerships (exercise science, habit formation, training adherence)
- Gym/facility partnerships (Imagine as the exercise program, not just the game)
- Physical merchandise — your boulder weight at 1,000km lifetime altitude, cast in resin

---

## 10. Why This Is Special

Let me be direct about this.

There are fitness games. There are hard games. There are philosophical games. There are art games. There are games that use real hardware.

**Imagine is the first game where the metaphor is the mechanic — and the mechanic is correct exercise science.**

Not "the metaphor is enhanced by the mechanic." Not "the mechanic supports the theme." The metaphor IS the mechanic — and the mechanic is grounded in how bodies actually adapt to training.

Sisyphus is punished by eternal labor under load. You are exercising under progressive overload. The boulder rolls back when he rests. Your fitness detrenches when you don't train. These are not two things that rhyme. They are the same adaptive system, described in myth and described in physiology, simultaneously.

**And here's the part Camus didn't say:** the boulder gets heavier because Sisyphus gets stronger. That's not tragedy on top of tragedy. That's the principle of progressive overload, embedded in the original myth. He couldn't stop getting stronger. The gods had to keep making the boulder heavier. He never reaches the summit — because he keeps getting stronger, and the boulder keeps pace. The sentence is the training program. The punishment is perfect periodization.

This has never been said clearly before. Not in this form. Not in a game.

**Getting Over It** showed that people will endure intentional frustration if the frustration *means something*. Imagine takes that insight and attaches it to something that changes your body using evidence-based training principles. The form bonus in The Climb isn't game design aesthetics — it's biomechanics. The FTP zones in The Summit aren't arbitrary difficulty labels — they're the same zones your cardiologist would use. The HIT system in The Burden isn't "hard mode" — it's the most efficient hypertrophy protocol currently supported by the research literature.

**The game only works if you work correctly.** Not just hard — correctly. You cannot just thrash on the rowing machine and expect progress. You have to find your stroke. You have to hold your zone. You have to earn the form bonus. Technique is the mechanic. Physiology is the reward system.

And when you finish a session — sweating, possibly shaking, maybe further than you started or maybe barely holding ground — the narrator will say something true. Not about the virtual altitude. Not about the meters on the screen. About the fact that you showed up, moved correctly, kept moving even when it was easier to stop, and then rested appropriately, because the adaptation happens in the rest.

That's the game. The whole game.

*One must imagine Sisyphus happy.*
*One must also imagine him well-trained.*
*Imagine helps.*

---

## Appendix A: Narrator Script Samples (Extended)

*For voice direction and tone reference.*

**On launching the game for the first time:**
> "You're here. Good. I wasn't sure you'd actually do this. Most people buy games like this and never launch them past the menu. You're past the menu now. That's something. Before we begin — I need to ask about your heart rate monitor. If you have one, connect it. The mountain learns from your heart. It's worth the setup."

**On the tutorial (there isn't one — this is the tutorial):**
> "There's no tutorial. You row, and the boat moves. You stop rowing, and it doesn't. The current moves regardless. The only other thing I'll tell you: smooth is fast. A sloppy stroke doesn't just feel bad — it does less work than a controlled one. The physics are honest here. Everything else you'll learn by doing."

**On completing the FTP test:**
> "Now we know where your threshold is. Not approximately — precisely. Everything from here is calibrated. Zone 2 is where you build the engine. Zone 4 is where you test it. Zone 5 is where you find out what you're actually made of. We'll revisit this in six weeks. You'll be different by then."

**On a very long Zone 2 session:**
> "You've been in Zone 2 for forty minutes. I want to be specific about what that means: you're building aerobic base. Your mitochondrial density is improving. Your cardiovascular system is making adaptations that Zone 5 intervals cannot replicate. This is not a lesser effort because it's comfortable. This is the foundation. Keep going."

**On returning after a month away:**
> "A month. I counted. The boulder moved back — not as far as you fear. Detraining takes longer than you think. Your cardiovascular fitness has declined some. Your muscle memory hasn't. The first session back will feel harder than it should, and then it will improve faster than you expect. That's the biological reality. Come back and confirm it."

**On setting a personal best:**
> "That's the highest you've ever been. Right now, in this moment, you are at the top of everything you've done. It won't last — you'll come back tomorrow and the mountain will have thoughts about that statement. But right now: yes. This is the top of you. Keep going."

**On HRV indicating poor recovery:**
> "Your heart rate variability is low this morning — lower than your average. I'm not telling you not to train. I'm telling you what your nervous system is reporting. A Zone 2 session today will help more than harm. A Zone 5 effort today will slow your adaptation. The choice is yours. The mountain doesn't force anything. It just responds to what you bring."

**On The Burden, picking the boulder back up:**
> "There it is. Right where you left it. The set is over — that's not failure, that's the point. Momentary muscular failure means the set was complete. Rest two minutes. The muscle needs it. Then pick it up. The path is still there."

**On a properly structured recovery week:**
> "This is the fifth day of your recovery week. Zone 1. Low volume. I know it feels like you're not doing anything. I want to correct that impression: this week is where the adaptation from the last four weeks finishes. The muscle fibers are completing repair. The aerobic adaptations are consolidating. The nervous system is resetting. When you come back next week, you will be different in ways you can measure. Rest is not the absence of training. Rest is training's partner."

---

## Appendix B: Hardware Compatibility Matrix

| Hardware | Mode | Protocol | BLE UUID | Priority |
|---|---|---|---|---|
| Concept 2 RowErg (PM5) | The Climb | USB Serial / BLE | `CE060030-43E5-11E4-916C-0800200C9A66` | MVP |
| Concept 2 BikeErg | The Summit | USB Serial / BLE | `CE060030-43E5-11E4-916C-0800200C9A66` | v1.0 |
| Generic ANT+ cadence sensor | The Summit | ANT+ USB | — | v1.0 |
| ANT+ / BLE power meter | The Summit | ANT+ / BLE | 0x1818 | v1.0 |
| Smart trainer (Wahoo KICKR, Tacx NEO) | The Summit | BLE FTMS | 0x1826 | v2.0 |
| BLE Heart Rate Monitor | All modes | BLE HRS | 0x180D | MVP (Climb), v1.0 (all) |
| Manual rep + tempo input | The Burden | UI / keyboard | — | MVP |
| Smart barbell collar (BLE) | The Burden | BLE proprietary | varies | v1.0 |
| Smart machine (Keiser M-series) | The Burden | BLE proprietary | varies | v1.0 |
| Phone camera (ML) | The Burden | Local inference | — | v2.0 |

---

## Appendix C: Glossary

**The Drift:** The backward movement experienced when a player rests during a session.
**Regression Offset:** The progress lost between sessions, proportional to time away (modeled on real detraining curves).
**Lifetime Progress:** Total accumulated effort across all sessions, never reset.
**Session Progress:** Single-session effort, resets on new session.
**The Boulder:** The visual representation of a player's Lifetime Progress and personal identity.
**Burden Score:** The combined metric for The Burden (total TUT × average load).
**Ghost:** A translucent replay of a player's best session from the last 30 days.
**The Narrator:** The game's philosophical voice-over presence. Scientifically literate. Never wrong about the physiology.
**Checkpoint:** A permanent altitude marker (The Climb) or single-use TUT marker (The Burden).
**Zone:** A terrain section (The Climb), gradient band (The Summit), or HR intensity band (universal).
**TUT:** Time Under Tension — the primary metric for The Burden. Seconds of controlled movement under load.
**FTP:** Functional Threshold Power — the highest power output sustainable for approximately one hour. The calibration anchor for The Summit's zone system.
**EPOC:** Excess Post-exercise Oxygen Consumption. The afterburn. Harder sessions earn longer in-game buffs (reduced regression) that persist after the session ends.
**HRV:** Heart Rate Variability. A recovery marker derived from RR intervals. Used to inform narrator recovery recommendations.
**Periodization:** Structured cycling of training stress and recovery over weeks. The meta-game follows base → build → peak → recovery blocks.
**Progressive Overload:** The requirement that training load must increase over time to continue driving adaptation. The boulder gets heavier because Sisyphus gets stronger.
**Form Bonus:** A progress multiplier awarded in The Climb and The Burden for technically correct movement (proper drive ratio, controlled tempo). The game rewards technique.
**Afterburn Duration:** The period following a session during which EPOC is active and regression is suspended or reduced.
**Recovery Intelligence:** A leaderboard metric rewarding players who follow evidence-based training:rest ratios.

---

## Appendix D: Exercise Science References

The following principles and sources inform the game's design. These are not listed for academic credibility — they're listed so the design team knows where the mechanics come from, and can defend them.

**High Intensity Training (The Burden):**
- Arthur Jones — Nautilus Training Principles (1970–1986)
- Doug McGuff, John Little — *Body by Science* (2009)
- Core principle: One working set to momentary muscular failure, slow tempo, progressive overload

**Aerobic Base / Zone 2 (The Climb, The Summit):**
- Phil Maffetone — MAF (Maximum Aerobic Function) training
- Iñigo San Millán — Zone 2 and mitochondrial adaptation
- Core principle: 60–70% max HR for base building; intensity kills volume, volume builds the engine

**Power-Based Cycling / FTP (The Summit):**
- Andrew Coggan, Hunter Allen — *Training and Racing with a Power Meter* (2010)
- Joe Friel — *The Cyclist's Training Bible*
- Core principle: FTP as anchor, power zones as training intensity guides

**Rowing Form (The Climb):**
- Concept 2 technique resources
- Drive sequence: legs → back → arms. Recovery: arms → back → legs.
- Drive ratio: 1:2 drive:recovery as baseline for efficient rowing

**EPOC:**
- Borsheim & Bahr (2003) — "Effect of exercise intensity, duration and mode on post-exercise oxygen consumption"
- Core principle: Higher intensity = longer elevated metabolism post-session

**Periodization:**
- Tudor Bompa — *Periodization: Theory and Methodology of Training*
- Core principle: Base → Build → Peak → Recovery cycles prevent overtraining and maximize adaptation

**HRV and Recovery:**
- Kiviniemi et al. (2007) — HRV-guided training
- Core principle: HRV suppression = nervous system stress = training should be moderated

---

*End of Document*

**IMAGINE GDD v0.2**
*Document maintained by James Sypherd*
*Exercise Science Revision by Kato*
*Next review: After MVP prototype begins*
