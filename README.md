# edp-map

Map tile hosting for [EDP](https://github.com/laenan8466/edp-map) scenarios, served via GitHub Pages.

## Structure

Each scenario lives in its own subfolder under `edp-map/`, containing pre-rendered tile images (`{z}/{x}/{y}.png`) plus any generated `index.html` for that map.

```
edp-map/
├── index.html
├── cache_tote_hosen_2026/
│   └── {zoom}/{x}/{y}.png
└── cache_acdc_final/
    └── {zoom}/{x}/{y}.png
```

## Adding a new map

1. Add a new subfolder under `edp-map/` with your scenario name.
2. Drop the tile pyramid into it, following the `{z}/{x}/{y}.png` convention.
3. Commit and push to `main`.

The map becomes reachable at:

```
https://laenan8466.github.io/edp-map/{SUBFOLDER_NAME}/
```

## Git LFS

Tile images are tracked with Git LFS (too many small binary files for a normal repo). Make sure LFS is set up locally before adding new tiles:

```bash
git lfs install
git lfs track "edp-map/**/*.png"
```

## Deployment

Pages is **not** deployed via the classic "Deploy from a branch" method, since that does not resolve LFS pointers — it would serve pointer stubs instead of the actual images. Deployment instead runs through GitHub Actions (`.github/workflows/pages.yml`), which checks out LFS objects properly before publishing.

Deployment triggers automatically on every push to `main`. Manual runs are also possible via the Actions tab (`workflow_dispatch`).
