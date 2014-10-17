Stata package uprate
====================

Uprates monetary variables from source years to common base or target years. The
program can be extended easily to incorporate different inflation definitions 
and/or different countries. First, uprating tables have to be created once via 
uprateit_create_table. These tables can be used furtheron to uprate any data
set.


## Installation

You can install the latest version of mvcollapse via Stata:

	. net from https://mloeffler.github.io/stata/
	. net install uprateit

Done.


## Data sources

* Germany, Consumer Price Index
    * Provided by the [Federal Statistical Office](http://www.destatis.de/)
    * [Verbraucherpreisindex f�r Deutschland - Lange Reihen ab 1948 - September 2014](https://www.destatis.de/DE/Publikationen/Thematisch/Preise/Verbraucherpreise/VerbraucherpreisindexLangeReihen.html)
    * Based on West Germany only until 1991


## Info

Copyright (C) 2014, [Max L�ffler](http://www.zew.de/en/staff/mlo) and
					[Sebastian Siegloch](http://siegloch.vwl.uni-mannheim.de/)

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
