Stata package uprateit
======================

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


## Use

First you have to create the relevant uprating table

	. uprateit_create_table datapath/uprate_de_cpi, country(de) account(cpi)

Then you can use the uprateit command to uprate monetary variables in your data set

	. uprateit gdp income using datapath/uprate_de_cpi, from(year) to(2010)

That's it. Variables gdp and income will now be in values as of 2010.


## Data sources

* Germany, Consumer Price Index
    * Provided by the [Federal Statistical Office](http://www.destatis.de/)
    * [Verbraucherpreisindex für Deutschland - Lange Reihen ab 1948, version 13.08.2020](https://www.destatis.de/DE/Themen/Wirtschaft/Preise/Verbraucherpreisindex/Publikationen/Downloads-Verbraucherpreise/verbraucherpreisindex-lange-reihen-xlsx-5611103.xlsx)
    * 1949-1962: Index der Einzelhandelspreise (based on West Germany only)
    * 1963-1991: Preisindex für die Lebenshaltung, Alle privaten Haushalte (based on West Germany only)
    * 1992-2019: Verbraucherpreisindex
    * 2020: assumed to equal CPI inflation rate of previous year
* Berlin, Germany, Consumer Price Index
    * Provided by the [Federal Statistical Office](http://www.destatis.de/) and the [Statistical Office Berlin-Brandenburg](http://www.statistik-berlin-brandenburg.de/)
    * [GENESIS-Online Datenbank](https://www-genesis.destatis.de/genesis/online), Tabellencode 61111-0010, downloaded 13.08.2020, [Verbraucherpreisindex in Berlin 1991 bis 2019 nach Abteilungen, version 23.07.2020](https://www.statistik-berlin-brandenburg.de/statistiken/langereihen/dateien/Verbraucherpreise.xlsx)
    * 1992-1995: Verbraucherpreisindex (Statistical Office Berlin-Brandenburg)
    * 1996-2019: Verbraucherpreisindex (Federal Statistical Office)
    * 2020: assumed to equal CPI inflation rate of previous year


## Info

Copyright (C) 2014-2020, [Max Löffler](http://www.maastrichtuniversity.nl/p70067847) and [Sebastian Siegloch](https://www.vwl.uni-mannheim.de/siegloch/)

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
