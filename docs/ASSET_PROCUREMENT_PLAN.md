# Thunderwalker Asset Procurement Plan

**Status:** Pre-production planning  
**Target:** MVP art assets for nAIVE engine  
**Timeline:** 1-2 weeks (art-focused phase)  
**Scope:** Player character, 3 enemy types, 5 environmental props + basic animations

---

## Executive Summary

Thunderwalker's art needs are achievable without hiring an artist by combining:
1. **Free assets** from curated sources (Quaternius, Poly Haven, Sketchfab CC0)
2. **AI-assisted generation** (Meshy.ai for rapid custom models)
3. **Procedural/modular systems** (Blender scripts to extend limited base assets)

**Realistic estimate:** $0–150 total cost, 30–50 hours labor, 1–2 weeks for MVP quality art.

---

## Recommended Asset Sources (Ranked by Cost/Quality/Time)

### Tier 1: Free — Start Here
These provide immediate, production-ready assets with zero cost.

| Source | Best For | Quality | License | Time to Use |
|--------|----------|---------|---------|------------|
| **Quaternius** (quaternius.com) | Low-poly characters, enemies, props | Medium | CC0 | 5 min |
| **Poly Haven** (polyhaven.com) | Environments, trees, PBR textures | High | CC0 | 10 min |
| **Sketchfab CC0** (sketchfab.com) | Mixed models, detailed creatures | Variable | CC0 | 15 min |
| **Poly Pizza** (poly.pizza) | Asset packs, FBX/GLTF ready | Medium | CC0 | 5 min |

**Priority:** Start here. 60–70% of game art can source from these.

#### Quaternius Specifics
- **700+ low-poly models** all CC0, organized by category
- **Free game kits:** RPG Character Pack, Ultimate Monsters, Medieval Village Pack, Stylized Nature
- **Formats:** FBX, OBJ (native; no conversion needed for nAIVE)
- **Rigging:** Many characters come pre-rigged with humanoid rigs
- **Performance:** Optimized for indie games, 2k–10k polys per model
- **No registration required** — direct download

##### Recommended Quaternius Assets for Thunderwalker
- **Player character:** RPG Character Pack → customize torso/armor
- **Wendigo:** Blend "Ultimate Monsters" (wolf) + custom shader for spirit appearance
- **Minor enemies:** Easy Enemy Pack (animated), Ultimate Animated Animal Pack (bears, spirits)
- **Environment:** Ultimate Nature Pack (trees, rocks), Medieval Village Pack (buildings → adapt to tribal structures)

#### Poly Haven Specifics
- **100% CC0 licensed**, community funded (donation-based)
- **Hyperreal 3D models** — mostly environment/prop focused
- **Textures & HDRIs** also available
- **Formats:** USDZ, GLB, OBJ, FBX (pick GLB/OBJ for nAIVE)
- **Quality:** High fidelity, suitable for VFX/close-up shots

##### Recommended Poly Haven Assets
- Rock formations, water elements, vegetation (season-appropriate)
- Download GLB → test import to nAIVE

#### Sketchfab CC0
- **Filter by license:** CC0 only (searchable)
- **Search terms:** "low-poly tribal," "wendigo," "spirit creature," "rock formation"
- **Download:** GLB/OBJ (both nAIVE compatible)
- **Caveat:** Quality varies; prioritize assets with 10k+ favorites/recent uploads

---

### Tier 2: AI-Assisted Generation ($0–100/month)
For custom assets not available in free libraries.

#### **Meshy.ai** (meshy.ai)

| Plan | Cost | Monthly Credits | Assets/Month | Best For |
|------|------|-----------------|--------------|----------|
| **Free** | $0 | 100 | ~10 models | Testing, quick iterations |
| **Pro** | $10–15/mo | 1,000 | ~100 models | Individual creator workflow |

**Free tier sufficient for MVP:** 100 credits/month = ~10 text-to-3D generations.

##### Workflow
1. **Prompt examples:**
   - "Low-poly seeker warrior with tribal clothing, Wyandotte inspired, game-ready"
   - "Wendigo creature, gaunt, skeletal, horror style, low-poly"
   - "Rock formation, weathered, game-ready texture"
2. **Output formats:** FBX, OBJ, GLB, USDZ → **use GLB for nAIVE**
3. **Processing time:** 2–10 minutes per model
4. **Ownership:** Free plan = CC BY 4.0 license (credit required); Pro plan = full ownership
5. **Texturing:** AI auto-textures; use default or customize via web UI

##### Recommended Meshy Workflow
- **Week 1:** Use free tier to generate 3–5 custom variants of character/enemies
- **Week 2:** If Pro is justified (time savings > $10), upgrade for texture refinement

**Alternative:** Tripo3D (similar pricing, slightly faster processing)

---

### Tier 3: Paid Asset Marketplaces ($20–500)
For polished, production-ready assets when free + AI sources are insufficient.

| Marketplace | Best For | Price Range | Advantage |
|-------------|----------|------------|-----------|
| **CGTrader** (cgtrader.com) | Characters, enemies, props | $5–100 each | Large inventory, artist-made |
| **TurboSquid** (turbosquid.com) | High-quality character packs | $15–150 each | Riggged, textured, animated |
| **GameDev Market** (gamedevmarket.net) | Indie-friendly, cheaper | $5–50 each | Smaller library but affordable |

**Recommendation:** Skip for MVP. Only use if Quaternius + Meshy gaps exceed 20% of assets.

**Example cost if forced to buy:**
- Player character: $30–60
- Wendigo: $25–50
- 2 minor enemies: $15–30 each
- 5 props: $5–10 each
- **Total: $120–200**

---

## Export/Import Guide for nAIVE

### nAIVE Format Support
- **Mesh formats:** GLTF 2.0 (`.gltf`, `.glb`), OBJ (`.obj`), FBX (`.fbx`)
- **Preferred:** **GLB** (binary GLTF, single file, includes textures)
- **Shaders:** SLANG/WGSL (nAIVE native); shader baking during import recommended
- **Polygon budget:** Depends on target platform; aim for 10k–50k polys per character, 5k–20k per prop

### Export Checklist

#### From Quaternius / Sketchfab / Poly Haven (Direct Download)
```
1. Download .glb or .obj file
2. (Optional) Open in Blender for cleanup:
   - Verify scale (1 unit = 1 meter)
   - Check for flipped normals (View > Face Orientation)
   - Remove unused data (Mesh > Clean Up)
3. Export as GLB (Blender: File > Export > glTF 2.0)
   - Include: Normals, UVs, Materials (if any)
   - Compression: ON (GLTF_FORMAT = glb)
4. Place in: /data/projects/naive/assets/models/
5. Import to nAIVE via engine asset loader
```

#### From Meshy.ai
```
1. Generate model in Meshy web UI
2. Download as GLB (preferred) or OBJ + MTL
3. If AI texturing applied:
   - Meshy exports with embedded textures (GLB)
   - No additional cleanup needed
4. If custom edits needed:
   - Open in Blender (Shift+O > Import > glTF 2.0)
   - Edit materials/UVs as needed
   - Re-export as GLB
5. Place in: /data/projects/naive/assets/models/
```

#### From Blender (Procedural Generation)
```
1. Create modular prop in Blender (see Procedural Section)
2. File > Export > glTF 2.0 (.glb)
3. Ensure:
   - Active object is the mesh (Ctrl+J to join if modular)
   - No empty objects, no linked data
   - Applied transforms (Ctrl+A > All Transforms)
4. Export settings:
   - Format: glTF Binary (.glb)
   - Include Normals: ON
   - Include UVs: ON
   - Material Export: ON
5. Place in: /data/projects/naive/assets/models/
```

### nAIVE Integration Example
```yaml
# In game YAML config:
assets:
  models:
    player_seeker:
      path: "assets/models/seeker_warrior.glb"
      scale: 1.0
      animation: humanoid
    
    enemy_wendigo:
      path: "assets/models/wendigo_gen01.glb"
      scale: 1.2
      animation: creature
```

---

## Asset Breakdown: What to Acquire Where

### Player Character (Seeker Warrior)

**Option A: Quaternius + Meshy Hybrid (Recommended, $0)**
- Source: RPG Character Pack from Quaternius (base humanoid)
- Time: 10 min download + 5 min Blender cleanup
- Fallback: Meshy text-to-3D with prompt "low-poly seeker warrior, tribal clothing"
- Time: 15 min generation + 10 min review

**Option B: Meshy.ai Custom ($0 free tier, or $10 if Pro upgrade)**
- Prompt: "Low-poly seeker warrior, Cherokee/Haudenosaunee inspired, game-ready, tribal clothing, leather armor"
- Variants: Generate 3–5, pick best
- Post-process: Light Blender cleanup (texture adjust, scale check)
- Time: 30 min end-to-end

**Option C: Premium ($40–80)**
- CGTrader "tribal warrior character" or TurboSquid "indigenous hero character"
- Includes rigging, animations, multiple outfits
- Time: 10 min browse, buy, download

**Recommendation:** Start with Quaternius, iterate with Meshy. Cost: $0. Time: 25 min.

---

### Enemy Models (Wendigo + 2 Spirits)

#### **Wendigo**
| Source | Cost | Quality | Time |
|--------|------|---------|------|
| Meshy.ai custom | $0 | Medium–High | 20 min |
| Sketchfab CC0 search | $0 | Variable | 30 min |
| Quaternius "Ultimate Monsters" + shader | $0 | Medium | 45 min |
| CGTrader "wendigo" | $30–50 | High | 15 min |

**Recommended path:** Meshy.ai (single prompt, fastest iteration).
- Prompt: "Wendigo creature, skeletal gaunt frame, antlers, horror style, low-poly game asset"
- Time: 20 min

#### **Spirit Creature #2 (e.g., Great Lynx)**
- Source: Quaternius "Ultimate Monsters" + custom shader OR Meshy.ai
- Prompt: "Great Lynx spirit creature, supernatural, shimmering, low-poly"
- Time: 15 min (Quaternius) or 20 min (Meshy)
- Cost: $0

#### **Spirit Creature #3 (e.g., Shadow Creature)**
- Source: Meshy.ai OR Sketchfab CC0
- Prompt: "Shadow creature, amorphous, hostile, low-poly game enemy"
- Time: 20 min (Meshy) or 30 min (search Sketchfab)
- Cost: $0

**Total enemy cost:** $0. **Total time:** 60 min.

---

### Environmental Props (5 Assets)

#### Recommended Selection
1. **Rock Formation** → Poly Haven (1 rock) + Blender procedural rock generator (cost: $0, time: 15 min)
2. **Tribal Building** → Quaternius Medieval Village Pack + Blender material swap (cost: $0, time: 20 min)
3. **Sacred Tree** → Poly Haven + Quaternius Nature Pack blend (cost: $0, time: 10 min)
4. **Campfire Stones** → Quaternius RPG Pack rocks + Blender arrange (cost: $0, time: 5 min)
5. **Totem Pole** → Meshy.ai custom (cost: $0, time: 20 min) OR Sketchfab search (30 min)

**Total prop cost:** $0. **Total time:** 70 min.

#### Sample Meshy Props Prompts
- "Tribal totem pole, carved, low-poly, game-ready"
- "Stone circle ritual site, low-poly, ancient"
- "Weathered wooden structure, indigenous dwelling, low-poly"

---

## Procedural Generation Strategy (Optional, but Recommended)

### Why Procedural?
- Extends limited free assets to create variety
- Generates modular pieces (wall tiles, rock clusters, vegetation)
- Minimal art skill required; scripting skill needed

### Blender Script Example: Modular Rocks

```python
# Save as: create_rock_cluster.py
# Usage: Blender --python create_rock_cluster.py
import bpy
import random

def create_rock_cluster(count=5, seed=42):
    random.seed(seed)
    bpy.ops.object.select_all(action='SELECT')
    bpy.ops.object.delete()
    
    for i in range(count):
        # Create UV sphere, scale randomly
        bpy.ops.mesh.primitive_uv_sphere_add(radius=random.uniform(0.5, 2.0))
        rock = bpy.context.active_object
        
        # Randomize scale per axis (bumpy)
        rock.scale.x *= random.uniform(0.8, 1.2)
        rock.scale.y *= random.uniform(0.8, 1.2)
        rock.scale.z *= random.uniform(0.8, 1.2)
        
        # Displace with noise for roughness
        disp = rock.modifiers.new(name="Displace", type='DISPLACE')
        texture = bpy.data.textures.new("NoiseTexture", type='CLOUDS')
        disp.texture = texture
        disp.strength = 0.3
        
        # Position in cluster
        rock.location.x = random.uniform(-3, 3)
        rock.location.y = random.uniform(-3, 3)
        rock.location.z = 0 + i * 0.1
    
    # Join all rocks
    bpy.ops.object.select_all(action='SELECT')
    bpy.ops.object.join()
    
    # Export
    bpy.ops.export_scene.gltf(filepath="rock_cluster.glb")

create_rock_cluster()
```

**Time to implement:** 10 min setup, 5 min per variant.

### Modular Building System
- Create 3–5 base tiles (wall, roof, door, window)
- Use Blender array modifier + rotation to create infinite house variants
- Export as separate meshes, compose in engine

**Estimated time:** 1–2 hours for full modular system.

---

## Timeline Estimate (1–2 Weeks)

### Week 1: Acquisition & Testing
| Day | Task | Time | Cost |
|-----|------|------|------|
| Mon | Download Quaternius packs, Meshy setup | 1 hr | $0 |
| Tue | Generate 5 character variants (Meshy) | 1.5 hrs | $0 |
| Wed | Download Poly Haven environments, organize | 1 hr | $0 |
| Thu | Meshy: 3 enemy generations + review | 1.5 hrs | $0 |
| Fri | Blender: cleanup, scale testing | 2 hrs | $0 |
| **Week 1 Total** | | **7 hrs** | **$0** |

### Week 2: Finalization & Integration
| Day | Task | Time | Cost |
|-----|------|------|------|
| Mon | Props: Meshy generation + Quaternius selection | 1.5 hrs | $0 |
| Tue | Blender: modular rocks + procedural props | 2 hrs | $0 |
| Wed | nAIVE integration testing (import, scale, material) | 2 hrs | $0 |
| Thu | Animation rigging / skeleton setup | 1.5 hrs | $0 |
| Fri | Shader/material finalization | 1 hr | $0 |
| **Week 2 Total** | | **8 hrs** | **$0** |

### **Total MVP Estimate: 15 hours, $0–10 (if Meshy Pro helps)**

---

## Free Assets Ready to Grab Now

### Immediate Downloads (No Processing)

#### Characters
1. **Quaternius RPG Character Pack**
   - URL: https://quaternius.com/ → RPG Character Pack
   - Format: FBX/OBJ (use OBJ for nAIVE)
   - Use: Player base, customize armor

2. **Sketchfab CC0 "Tribal Warrior"**
   - Search: site:sketchfab.com "tribal warrior" CC0 license
   - Recent: Select by date, <1 year old
   - Format: GLB preferred

#### Environments
1. **Poly Haven Rock Formations**
   - URL: https://polyhaven.com/ → Search "rock"
   - Filter: GLB or OBJ
   - Use: Scattered landscape elements

2. **Quaternius Stylized Nature MegaKit**
   - URL: https://quaternius.com/ → Stylized Nature MegaKit
   - Includes: Trees, rocks, shrubs (all low-poly)

#### Quick Wins (5-minute setup)
- Quaternius Medieval Village Pack (adapt buildings → tribal structures)
- Quaternius Ultimate Monsters (base for Wendigo variant)
- Poly Pizza asset packs (pre-assembled, FBX/GLTF)

---

## Cost Estimates

### Scenario A: Zero Budget (Recommended for MVP)
| Item | Source | Cost | Quality |
|------|--------|------|---------|
| Player character | Quaternius + Meshy.ai free | $0 | 7/10 |
| 3 enemies | Meshy.ai free + Quaternius | $0 | 7/10 |
| 5 props | Poly Haven + Quaternius + procedural | $0 | 6/10 |
| **Total** | | **$0** | **6.5/10** |

**Verdict:** Sufficient for pre-alpha/vertical slice. Art will look indie but cohesive.

---

### Scenario B: $50 Budget (Modest Quality Boost)
| Item | Source | Cost | Quality |
|------|--------|------|---------|
| Player character | Meshy.ai Pro (1 month) | $10 | 8/10 |
| 3 enemies | Meshy.ai + CGTrader "Wendigo" | $35 | 8.5/10 |
| 5 props | Poly Haven + Quaternius | $0 | 7/10 |
| **Total** | | **$45** | **7.8/10** |

**Verdict:** Noticeable quality jump. Character/enemies feel more polished. Recommended if time budget exists for integration.

---

### Scenario C: $150–200 Budget (High Quality)
| Item | Source | Cost | Quality |
|------|--------|------|---------|
| Player character | TurboSquid premium character pack | $60 | 9/10 |
| 3 enemies | CGTrader per-model purchases | $80 | 8.5/10 |
| 5 props | Poly Haven + paid asset pack | $20 | 8/10 |
| **Total** | | **$160** | **8.5/10** |

**Verdict:** Looks polished, production-ready. Only if budget allows or deadline requires.

---

## Respect & Authenticity Checklist

Per Thunderwalker GDD:

- [ ] All creatures sourced/generated with reference to published ethnographic sources
- [ ] No sacred ceremonial content used as game mechanics
- [ ] Tribal structure designs drawn from real architecture (not stereotypes)
- [ ] Cultural consultant review before any public release
- [ ] Free assets properly CC-licensed and credited
- [ ] Meshy.ai-generated assets: credit Meshy if free tier used (CC BY 4.0)
- [ ] No headdresses, "war drums," or generic "Native" stereotypes in final art

**Action:** Before Week 2 finalization, schedule consultation with Indigenous cultural advisor.

---

## Risk Mitigation

### Risk: Free assets don't match Thunderwalker's style
**Mitigation:** Meshy.ai's AI can iterate rapidly. 3–5 generations per model = high hit rate.

### Risk: Polygon budget exceeded
**Mitigation:** Use Blender's "Decimate" modifier (reduces polys 30–50% with quality loss).
```blender
Object > Modifiers > Decimate (Ratio: 0.7)
```

### Risk: Animation rigging too time-consuming
**Mitigation:** Quaternius models pre-rigged. Use humanoid rig + Rigify auto-rigging.

### Risk: Textures don't import correctly to nAIVE
**Mitigation:** Test import 1 asset early (by end of Week 1). Adjust workflow if needed.

---

## Tools Required (All Free)

- **Blender 4.0+** (free, open-source)
- **Meshy.ai account** (free tier)
- **Git** (for version control of YAML configs)
- **nAIVE engine** (build from repo)

**No paid software required.**

---

## Next Steps

### Immediate (Today)
1. [ ] Register Meshy.ai account (2 min)
2. [ ] Download Quaternius RPG Character Pack (5 min)
3. [ ] Download Poly Haven rock/tree assets (10 min)
4. [ ] Test nAIVE import of one GLB (20 min)

### This Week
1. [ ] Generate 5 character variants on Meshy.ai
2. [ ] Meshy: 3 enemy prompts, iterate on best
3. [ ] Blender: cleanup + scale pass
4. [ ] Start cultural consultation outreach

### Next Week
1. [ ] Props finalization
2. [ ] Procedural generation scripts (if time permits)
3. [ ] nAIVE YAML config + asset manifest
4. [ ] Animation/rigging pass
5. [ ] Cultural consultant review + revisions

---

## Recommended Reading

- **Poly Haven Documentation:** https://polyhaven.com/help
- **Quaternius Asset Showcase:** https://quaternius.com/tutorials.html
- **Meshy.ai Tutorial:** https://docs.meshy.ai/en/
- **Blender glTF Export:** https://docs.blender.org/manual/en/latest/addons/import_export/scene_gltf2.html
- **nAIVE Asset Loader:** `/data/projects/naive/docs/nAIVE_Engine_PRD_v5.0.md` (Section: Asset Format & Import)

---

**Document Version:** 1.0  
**Created:** 2026-03-27  
**For:** Thunderwalker MVP Asset Pipeline  
**Reviewed by:** [Pending cultural consultant]
