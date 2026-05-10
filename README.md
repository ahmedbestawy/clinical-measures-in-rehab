# clinical-measures-in-rehab

As a physio, I know how tedious it is to manually calculate scores and check thresholds for large data-sets. I wrote these R functions to automate the heavy lifting for 16 of the most common cardio, neuro, and MSK measures.

The code is heavily optimized. I used `data.table` and `fcase` to vectorize the operations, so it runs incredibly fast. More importantly, I made sure the logic is strictly evidence-based—every formula is backed by validated clinical research.

## Requirements

-   R (version 4.0 or higher)
-   `data.table` package

## Function Reference

### 1. Cardiopulmonary Rehabilitation

| Function         | Description                  | Source                  |
|:-----------------|:-----------------------------|:------------------------|
| `calculate_bmi`  | Body Mass Index (kg/m²)      | WHO Classification      |
| `calculate_thr`  | Target Heart Rate (Karvonen) | Karvonen et al. (1957)  |
| `calculate_hrr`  | Heart Rate Reserve           | Karvonen et al. (1957)  |
| `calculate_map`  | Mean Arterial Pressure       | Mohrman & Heller (2018) |
| `calculate_WtHR` | Waist-to-Height Ratio        | Ashwell & Hsieh (2005)  |
| `calculate_VE`   | Minute Ventilation           | Standard Physiology     |

### 2. Neurological Rehabilitation

| Function | Description | Source |
|:-----------------------|:-----------------------|:-----------------------|
| `calculate_TUG` | Timed Up and Go (Risk Category) | Podsiadlo & Richardson (1991) |
| `calculate_gait_speed` | 10m Walk Test (Ambulation Category) | Perry et al. (1995) |
| `calculate_BBS` | Berg Balance Scale (Fall Risk) | Berg et al. (1992) |
| `calculate_reach_distance` | Functional Reach Test (Risk Category) | Duncan et al. (1990) |
| `calculate_6min_walk_distance` | Predicted 6MWT Distance (Enright) | Enright & Sherrill (1998) |

### 3. Musculoskeletal Rehabilitation

| Function | Description | Source |
|:-----------------------|:-----------------------|:-----------------------|
| `calculate_LEFS` | Lower Extremity Functional Scale (%) | Binkley et al. (1999) |
| `calculate_NDI` | Neck Disability Index (Category) | Vernon & Mior (1991) |
| `calculate_ROM_percentage` | Joint Range of Motion Deficit (%) | Clinical Standard |
| `calculate_LSI` | Limb Symmetry Index (%) | Clinical Standard |
| `calculate_1RM` | Estimated 1-Rep Max (Brzycki) | Brzycki (1993) |
