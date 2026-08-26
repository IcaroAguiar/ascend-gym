# Third-party notices

openGym — Copyright (C) 2026 Duarte Santos.
openGym's own code is licensed under the **GNU AGPL v3.0** (see [LICENSE](LICENSE)).

## ASCEND Gym modifications

ASCEND Gym is a modified distribution maintained by Ícaro Aguiar. It preserves the openGym
copyright and license notices and incorporates the AI Coach work from
[alexpcosta/opengym](https://github.com/alexpcosta/opengym). ASCEND Gym modifications are
distributed under the same GNU AGPL v3.0. The ASCEND name and visual identity do not replace
or remove the authorship notices for the underlying code.

## App store exception

As an additional permission under section 7 of the AGPL v3.0, the copyright holder permits
distribution of the openGym mobile application through app store platforms (such as the
Apple App Store and Google Play) whose terms of service would otherwise be incompatible
with the AGPL, provided the corresponding source code remains available under the AGPL at
the project repository. This permission applies to the distribution channel only and does
not otherwise limit the license.

This additional permission was granted by the original copyright holder for the upstream mobile
application. This baseline does not assert a separate app-store exception for ASCEND Gym's own
modifications. Review that boundary before distributing a modified mobile application through an
app store.

## Bundled AI providers

The API image installs the Claude Agent SDK and a pinned OpenAI Codex CLI so the optional AI
Coach can run without a host installation. These components keep their own licenses and service
terms. Their inclusion does not grant permission to share a personal provider account or resell
provider access.

The instance owner supplies the provider credential. ASCEND Gym ships no credential. Leave the
Coach disabled, or set `COACH_DISABLED=1`, unless the instance owner has confirmed that the
intended multi-user use complies with the selected provider's terms.

## Body diagram geometry

The muscle outlines the body maps are drawn from (`frontend/src/lib/body-paths.js`) are derived
from [**MuscleMap**](https://github.com/melihcolpan/MuscleMap) by Melih Colpan, used under the
**MIT License** and reproduced below. MuscleMap ships its path data as Swift source rather than
`.svg` files; the paths were converted to a JSON module, its sub-group shapes were dropped, and
nothing else about the artwork was changed.

```
MIT License

Copyright (c) 2026 Melih Colpan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Exercise data & media

The exercise names, instructions (English in `frontend/src/lib/exercises-data.js`, other
languages in `frontend/src/instr/`, regenerated via `scripts/build-instructions.mjs`), images
and animations (fetched into `media/` at build time) come from
[**hasaneyldrm/exercises-dataset**](https://github.com/hasaneyldrm/exercises-dataset)
and are **not** covered by openGym's AGPL license — they remain under that dataset's own terms.
The media files are not distributed in this repository; they are downloaded from the upstream
source on first run. The dataset currently describes its code, data structure and instruction
text as MIT-licensed, while the images and GIFs are credited to Gym Visual and require separate
permission for reuse. Preserve the attribution and obtain the necessary media rights before a
public or commercial redistribution. See the dataset's current `LICENSE` and `NOTICE.md`.
