Copyright (C) 2018 m335
See the end of the file for license conditions.
See license.txt for kneeboardIndexer license conditions.

Kneeboard group indexing and construction tool for DCS World. See "_export" for binary images.

# OBSOLETE

No longer maintained or expected to be useful for DCS World, due to improvments in VR software. Specifically, Oculus Dash overlays, as well as the general superiority of OpenVR, Vive, Pimax, and similar, render this toolchain unnecessary.

However, the codebase does remain a good example for a process to convert large PDF files into chapters at intervals of ten PNG files each.


# Usage

Use a voice command like "kneeboard 10 forward" to skip kneeboard chapters.


# Design

Source files, including PDF, are separated into groups by script. See "core.sh" and "vehicles.sh" . These groups are padded with blank pages to multiples of ten.


__Copyright__
This file is part of kneeboardIndexer.

kneeboardIndexer is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

kneeboardIndexer is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with kneeboardIndexer.  If not, see <http://www.gnu.org/licenses/>.
