*! version 0.1, 16oct2014, Max L�ffler <loeffler@zew.de>
/**
 * UPRATEIT - UPRATE MONETARY VARIABLES ACCORDING TO INFLATION INDICIES
 * 
 * (part of package uprateit, creates uprating tables from raw inflation data)
 */


/**
 * Creates uprating table for a specific measure and saves crosswalk data set
 * 
 * @package uprateit
 * @param `filename' Path where to save the created uprating table
 * @param `country'  Country code of the relevant uprating table
 * @param `account'  Which account/measure should be used for uprating
 */
program define uprateit_create_table
    version 13
    syntax anything(id=filename name=filename), Country(string) [Account(string)]
    tempname g up
    
    // Uprate Germany
    if ("`country'" == "de") {
        // No account specified? Use cpi!
        if ("`account'" == "") {
            di as text "No account specified. Use 'cpi' by default."
            local account = "cpi"
        }
        
        // Consumer price index
        if ("`account'" == "cpi") {
            mat `g' = ( 1980,     .   \ ///
                        1981,    6.3  \ ///
                        1982,    5.2  \ ///
                        1983,    3.2  \ ///
                        1984,    2.5  \ ///
                        1985,    2.0  \ ///
                        1986,   -0.1  \ ///
                        1987,    0.2  \ ///
                        1988,    1.2  \ ///
                        1989,    2.8  \ ///
                        1990,    2.6  \ ///
                        1991,    3.7  \ ///
                        1992,    5.1  \ ///
                        1993,    4.5  \ ///
                        1994,    2.6  \ ///
                        1995,    1.8  \ ///
                        1996,    1.4  \ ///
                        1997,    2.0  \ ///
                        1998,    1.0  \ ///
                        1999,    0.6  \ ///
                        2000,    1.4  \ ///
                        2001,    2.0  \ ///
                        2002,    1.4  \ ///
                        2003,    1.1  \ ///
                        2004,    1.6  \ ///
                        2005,    1.6  \ ///
                        2006,    1.5  \ ///
                        2007,    2.3  \ ///
                        2008,    2.6  \ ///
                        2009,    0.3  \ ///
                        2010,    1.1  \ ///
                        2011,    2.1  \ ///
                        2012,    2.0  \ ///
                        2013,    1.5)
        }
    }
    else if ("`country'" == "us") {
        mat `g' = (1980, .)
    }
    
    // Check for growth matrix
    cap local n = rowsof(`g')
    local n = cond("`n'" != "", "`n'", "0")
    
    // Growth matrix defined
    if (_rc == 0 & `n' >= 2) {
        // Set up diagonal matrix
        mat `up' = diag(J(1, `n', 1))
        
        // Fill off-diagonal fields
        local coln year
        forval r = 1/`n' {
            forval c = 1/`n' {
                if (`c' > `r') ///
                    mat `up'[`r',`c'] = `up'[`r',`c' - 1] * (100 + `g'[`c',2]) / 100
                else if (`c' < `r') ///
                    mat `up'[`r',`c'] = `up'[`r' - 1,`c'] / (100 + `g'[`r',2]) * 100
            }
            local coln `coln' y`=`g'[`r',1]'
        }
        mat `up' = (`g'[1...,1], `up')
        mat coln `up' = `coln'

        // Save matrix
        clear
        qui svmat `up', names(col)
        save `filename', replace
    }
    // No growth matrix defined
    else di as text "Country and/or account not found. No uprating table created."
end

***
