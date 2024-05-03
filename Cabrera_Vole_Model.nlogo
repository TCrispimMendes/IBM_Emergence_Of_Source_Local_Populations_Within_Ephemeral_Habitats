extensions [
  r
  time ;; version 1.4.1
  CSV
]

__includes ["time-series.nls"] ;; Implementation of primitives to time-series


globals
[
 ;; schedule
  start_date ;; simulation start date (time extension)
  ts ;; time-series for reproduction and immigration values (time- extension)
  max_ticks ;; maximum simulation ticks

 ;; patches
  colony  ;; patch-set with colony patches

 ;; cabreras
  ;;various
  male_founder_area ;; maximum area of the home-range of male founder
  female_founder_area ;; maximum area of the home-range of female founder
  female_founder_radius ;; maximum radius of the home-range of female founder
  genotype ;; used in the creation of new genotypes

  ;; reproduction
  min_overlap_mate ;; minimal overlap to form a breeding pair
  maturation_age ;; maturation age (start of reproduction)
  t_gestation ;; gestation time
  t_lactation ;; lactation time
  t_new_estrus ;; time needed between breeding and re-entering a new estrus
  reproduction_prob  ;; reproduction probability

  ;; survival
  max_age ;; maximum age (used to define maximum age of immigrants)
  survival_adult ;; probability of dying for adults (weekly)
  survival_sub-adult ;; probability of dying for sub-adults (weekly)
  survival_juvenile ;; probability of dying for juvelines (weekly)

  ;; migration
  nest_leave_age ;; age when juveniles disperse from the mother's territory
  emigration_prob ;; probability of an individual emigrating (weekly)
  immigration_prob ;; probability of an immigrant entering the patch (weekly)

;; monitors
  ;; Other Parameters
  n_forced_out ;; number of individuals forced to leave (no patch space) at nest leaving
  n_normal_out ;; number of individuals who migrated according to dispersion rules
  n_try_in ;; number of individuals who were unable to enter the patch (due to lack of space) according to the immigration rule
  n_die ;; total number of individuals who died of natural causes according to the rules of survival
  n_born ;; total number of individuals born in the patch
  n_in ;; number of individuals who entered the patch under the immigration rule
  n_in_13w ;; number of individuals who entered the patch under the immigration rule in the last 13 weeks
  n_out_13w ;; number of individuals who left the patch in the last 13 weeks

  t_extinction  ;; Total number of extinctions that occurred in the patch over the course of the simulation
  t_recolonization ;; Total number of recolonizations that occurred in the patch over the course of the simulation

  n_rep_with_pair ;; number of reproduction events between individuals forming a breeding pair
  n_rep_without_pair ;; number of reproduction events between individuals without a breeding pair
  n_rep_out_pair_F ;; number of reproduction events between a female with a breeding pair and a male without a breeding pair
  n_rep_out_pair_M ;; number of reproductive events between a male with a breeding pair and a female without a breeding pair
  n_rep_out_pair_FM ;; number of reproduction events between individuals with different breeding pairs

  n_males ;; number of males over the age of lactation
  n_females ;; number of females over the age of lactation
  n_last_week ;; number of individuals in the last week (used to calculate extinctions and recolonizations)

  ;; Output Parameters
  Sex-Ratio ;; Snapshot of Cabrera voles sex ratio (proportion of males) in the local patch, calculated with the equation: N_males⁄(N_females + N_males)
  Residency ;; Snapshot of the average residence time of Cabrera voles in the local patch (in weeks)
  Density ;; Snapshot of the density of Cabrera voles /ha in the patch
  Monogamy ;; Incidence of monogamous mating (mating events that occur between defined breeding pairs) in the last three months
  LRER ;; Local recruitment effectiveness ratio (effectiveness of local recruitment against immigration in the last three months) in the last three months, calculated with the equation: (N_births - N_immigrats)⁄(N_Births + N_immigrats)
  Recruitment  ;; Percentage of the population that was recruited (through births and immigration) in the last three months
  MER ;; Migration effectiveness ratio (ratio of net migration to gross migration) in the last three months, calculated with the equation:(N_immigrats – N_emigrats)⁄(N_immigrats + N_emigrats)
  Extinction ;; Number of extinction events that occurred in the patch in the last three months
  Recolonization ;; Number of recolonization events that occurred in the patch in the last three months
  N_alleles ;; Snapshot of the mean number of alleles per locus
  HO ;; Snapshot of the observed heterozygosity
  HE ;; Snapshot of the expected heterozygosity
  Fis ;; Snapshot of the inbreeding coefficient
  Relatedness ;; Snapshot of the mean relatedness coefficient among individuals (estimator wang.fin)

  ;; Output Parameters per week
  t_extinction_13
  t_recolonization_13
  Extinction_13
  Recolonization_13
  Density_13
  Sex-Ratio_13
  Monogamy_13
  Residency_13
  MER_13
  Recruitment_13
  LRER_13
  N_alleles_13
  HE_13
  HO_13
  Fis_13
  Relatedness_13

  t_extinction_26
  t_recolonization_26
  Extinction_26
  Recolonization_26
  Density_26
  Sex-Ratio_26
  Monogamy_26
  Residency_26
  MER_26
  Recruitment_26
  LRER_26
  N_alleles_26
  HE_26
  HO_26
  Fis_26
  Relatedness_26

  t_extinction_39
  t_recolonization_39
  Extinction_39
  Recolonization_39
  Density_39
  Sex-Ratio_39
  Monogamy_39
  Residency_39
  MER_39
  Recruitment_39
  LRER_39
  N_alleles_39
  HE_39
  HO_39
  Fis_39
  Relatedness_39

  t_extinction_52
  t_recolonization_52
  Extinction_52
  Recolonization_52
  Density_52
  Sex-Ratio_52
  Monogamy_52
  Residency_52
  MER_52
  Recruitment_52
  LRER_52
  N_alleles_52
  HE_52
  HO_52
  Fis_52
  Relatedness_52

  t_extinction_65
  t_recolonization_65
  Extinction_65
  Recolonization_65
  Density_65
  Sex-Ratio_65
  Monogamy_65
  Residency_65
  MER_65
  Recruitment_65
  LRER_65
  N_alleles_65
  HE_65
  HO_65
  Fis_65
  Relatedness_65

  t_extinction_78
  t_recolonization_78
  Extinction_78
  Recolonization_78
  Density_78
  Sex-Ratio_78
  Monogamy_78
  Residency_78
  MER_78
  Recruitment_78
  LRER_78
  N_alleles_78
  HE_78
  HO_78
  Fis_78
  Relatedness_78

  t_extinction_91
  t_recolonization_91
  Extinction_91
  Recolonization_91
  Density_91
  Sex-Ratio_91
  Monogamy_91
  Residency_91
  MER_91
  Recruitment_91
  LRER_91
  N_alleles_91
  HE_91
  HO_91
  Fis_91
  Relatedness_91

  t_extinction_104
  t_recolonization_104
  Extinction_104
  Recolonization_104
  Density_104
  Sex-Ratio_104
  Monogamy_104
  Residency_104
  MER_104
  Recruitment_104
  LRER_104
  N_alleles_104
  HE_104
  HO_104
  Fis_104
  Relatedness_104
  ]

breed [cabreras cabrera]
breed [homeranges homerange]

cabreras-own [
  sex
  age
  home_range ;; patch-set with all homerange patches
  home_range_size ;; number of homeranges = area in m²
  my-genes ;; genetic code
  genes ;; genetic code (as a phrase, used to calculate genetic metrics)
  parents_ID ;; "who" (ID) of father and mother
  residence_time ;; residence time in the patch
  breeding_status ;; "who" (ID) of the breeding pair
  t_without_mate ;; time without breeding pair
  n_litters  ;; number of litters
  last_reproduction ;; week of last breeding
  give_birth ;; week that will give birth
  father_ID ;; "who" (ID) of the father of the litter in gestation
  father_genes ;; genes of the father of the litter in gestation
  ]

homeranges-own [
  name ;; "who" (ID) of the respective individual to which they belong
  ]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  Setup  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to setup

  clear-all

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Set Variables ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ;; schedule

  set max_ticks 104 ;; 2 years

  set start_date time:anchor-to-ticks (time:create "2020/10/01") 7 "days"  ;; start the simulation on October 1, 2020, with 7-day increments (linked to ticks)

  set ts ts-load "time_series_rep_immig.csv"  ;; loads the time-series with the values referring to the minimum and maximum probability of reproduction and immigration per month

 ;; cabreras
  ;; reproduction
  set min_overlap_mate 0.8
  set maturation_age 8
  set t_gestation 3
  set t_lactation 2
  set t_new_estrus t_gestation + t_lactation

  ;; survival
  set survival_adult 0.020
  set survival_sub-adult 0.123
  set survival_juvenile 0.123

  ;; migration
  set nest_leave_age 6
  set max_age 77

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  set_patch_and_founders

  set N_last_week count cabreras

  reset-ticks

end

to set_patch_and_founders

 ;; set the patch
  ask patch 0 0 [set colony patch-set patches in-radius sqrt (Patch_Size / pi)]  ;; define the area considered as a colony
  ask colony [set pcolor green]

 ;; set data of the founder male
  let male-genes create-genes
  set male_founder_area create_male_area
  let male-radius sqrt (male_founder_area / pi) ;; calculates the radius of the home-range
  let male-location one-of colony with [count patches in-radius male-radius with [pcolor = black] < 1]  ;; defines a location in the colony that meets the requirements

 ;; add male founder
  create-cabreras 1 [
    move-to male-location
    custom-cabrera
    set sex "M"
    set color 93 ;; blue
    set my-genes male-genes
    set genes (word my-genes)
    set genes substring (genes) 1 63
    set home_range patch-set patches in-radius male-radius ;; define an agentset with all patches in the home-range
    set home_range_size count home_range
    let me self
    ask home_range [
      if colored_home-ranges [set pcolor blue]
      sprout-homeranges 1 [  ;; create in each patch an individual of the breed "homeranges"
        hide-turtle
        set name [who] of me  ;; defines the name of "homeranges" as the cabrera ID
      ]
    ]
  ]


 ;; set data of the founder female
  let female-genes create-genes
  let female-location create_female_founder_location  ;; defines a location in the colony that meets the requirements

 ;; add male founder
  create-cabreras 1 [
    move-to female-location
    custom-cabrera
    set sex "F"
    set color 133  ;; pink
    set my-genes female-genes
    set genes (word my-genes)
    set genes substring (genes) 1 63
    set home_range patch-set patches in-radius female_founder_radius  ;; define an agentset with all patches in the home-range
    set home_range_size count home_range
    let me self
    ask home_range [
      if colored_home-ranges [set pcolor pink]
      sprout-homeranges 1 [ ;; create in each patch an individual of the breed "homeranges"
        hide-turtle
        set name [who] of me]  ;; defines the name of "homeranges" as the cabrera ID
    ]
  ]

end


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  GO  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to go

  if ticks = max_ticks [stop]
  tick

  ;;processes at the system level
  Variables_Updating

  ;; processes at agent level
  Ageing
  Nest_Leaving
  Breeding_Status_Updating
  Mate_Searching
  Reproduction
  Birthing
  Emigration
  Immigration
  Survival

  ;;processes at the system level
  Outputs_Collection

end


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  processes at agent level  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to Ageing    ;; One week is added to each Cabrera vole age (age) and residence time (residence_time) at each time step.

  ask cabreras [
    set age age + 1 ;;  add +1 week to age
    set residence_time residence_time + 1]  ;; add +1 week to residence_time

end

to Nest_Leaving ;;In the week a Cabrera vole reaches the nest leaving age (nest_leave_age), it moves out his mother territory, and tries to establish its own territory in the patch. If no space enough is available within the patch, that individual is forced to emigrate.

  let females cabreras with [
    sex = "F" and
    age >= nest_leave_age]

  let males cabreras with [
    sex = "M" and
    age >= nest_leave_age]

  ;; females
  ask females with [age = nest_leave_age]  ;; ask females aged nest_leave_age to
    [let female_area create_female_area  ;; define the home-range area
      let female-radius sqrt (female_area / pi)  ;; calculate the home-range radius

      let related_F females with [  ;; define related females as
        (member? who [parents_ID] of myself or  ;; be one of my parents (my mom) and
          parents_ID = [parents_ID] of myself )] ;; be my parents' son (my sister)

      let unrelated_F females with [not member? self related_F]  ;; define unrelated females as females that do not belong to related_F

      let female-location one-of colony with [count patches in-radius female-radius with [pcolor = black] < 1 and  ;; define a location where the margins of the home-range do not go outside the limits of the colony and
        count homeranges with [member? name ([who] of females)] in-radius female-radius < (0.10 * female_area)]  ;; <10% overlap with "females"

      ifelse female-location != nobody  ;; differentiate cases where there are possible locations or not
        [move-to female-location  ;; if there is a location, move to that location
          set home_range patch-set patches in-radius female-radius
          set home_range_size count home_range
          let me self ;
          ask home_range [
            if colored_home-ranges [set pcolor pink]
            sprout-homeranges 1 [
              hide-turtle
              set name [who] of me]
          ]
      ]

      [set female-location one-of colony with [count patches in-radius female-radius with [pcolor = black] < 1 and  ;; if there is no location, reset female-location
        count homeranges with [member? name ([who] of unrelated_F)] in-radius female-radius < (0.10 * female_area) and  ;; <10% overlap with "unrelated_F"
        count homeranges with [member? name ([who] of related_F)] in-radius female-radius < (0.80 * female_area)] ;; <80% overlap with "related_F"

      ifelse female-location != nobody  ;; differentiate cases where there are possible locations or not
        [move-to female-location  ;; if there is a location, move to that location
          set home_range patch-set patches in-radius female-radius
          set home_range_size count home_range
          let me self
          if (any? homeranges with [name = (item 0 [parents_ID] of me)] in-radius female-radius) and  ;; if my home-range overlaps my dad's home-range and
          count homeranges with [name = (item 1 [parents_ID] of me)] in-radius female-radius > (0.10 * female_area)  ;; and my home-range overlaps >10% my mother's home-range
          [set breeding_status "helper"]  ;; define breeding_status as "helper"
          ask home_range [
            if colored_home-ranges [set pcolor pink]
            sprout-homeranges 1 [
              hide-turtle
              set name [who] of me]
          ]
      ]

      [set n_forced_out n_forced_out + 1  ;; in case there is no location, add +1 to the variable "n_forced_out-gen"
       set n_out_13w n_out_13w + 1  ;; in case there is no location, add +1 to the variable "n_out_13w"
        die] ;; die (equivalent to leaving the patch due to lack of space)
    ]
    ]


    ;;males
  ask males with [age = nest_leave_age]  ;; asks males aged nest_leave_age to

    [let male_area create_male_area  ;; define the home-range area
      let male-radius sqrt (male_area / pi)  ;; calculate the home-range radius

      let male-location one-of colony with [count patches in-radius male-radius with [pcolor = black] < 1 and  ;; define a location where the margins of the home-range do not go outside the limits of the colony and
        count homeranges with [member? name ([who] of males)] in-radius male-radius < (0.10 * male_area)]  ;; <10% overlap with "males"

      ifelse male-location != nobody  ;; differentiate cases where there are possible locations or not
        [move-to male-location  ;; if there is a location, move to that location
          set home_range patch-set patches in-radius male-radius
          set home_range_size count home_range
          let me self
          ask home_range [
            if colored_home-ranges [set pcolor blue]
            sprout-homeranges 1 [
              hide-turtle
              set name [who] of me]
          ]
      ]

      [set n_forced_out n_forced_out + 1  ;; in case there is no location, add +1 to the variable "n_forced_out-gen"
       set n_out_13w n_out_13w + 1  ;; in case there is no location, add +1 to the variable "n_out_13w"
        die]  ;; die (equivalent to leaving the patch due to lack of space)
    ]


end

to Breeding_Status_Updating   ;; Updates the Cabrera voles breeding status variable

 ;; update mate information
  ask cabreras with [
    age >= maturation_age and
    not any? link-neighbors and  ;; without mate
    breeding_status != "helper" and
    breeding_status != "overlaper"]
  [set breeding_status "no-mate"]


  ;; update the status of the "helpers"
  ask cabreras with [age >= nest_leave_age] [if breeding_status = "helper" [
    let female-radius sqrt (home_range_size / pi)  ;; calculate the home-range radius
    let me self

    if (not any? homeranges with [name = (item 0 [parents_ID] of me)] in-radius female-radius) or  ;; if my home-range overlaps with my parent's home-range or
    (not any? homeranges with [name = (item 1 [parents_ID] of me)] in-radius female-radius) [set breeding_status "no-mate"] ;; overlaps my mother's home-range, sets breeding_status to "no-mate"
  ]]


  ;; update the status of the "overlapers"
  ask cabreras with [age >= nest_leave_age] [if breeding_status = "overlaper" [
    let female-radius sqrt (home_range_size / pi)
    let related_paired_F cabreras with [
      sex = "F" and
      any? link-neighbors and  ;; with mate
      who != [who] of myself and ;; other than me
      (member? who [parents_ID] of myself or  ;; one of my parents and
        parents_ID = [parents_ID] of myself or ;; be my parents' son (my brother)
        member? [who] of myself parents_ID)]  ;; my son

    if count homeranges with [member? name ([who] of related_paired_F)] in-radius female-radius <= (0.10 * home_range_size) [set breeding_status "no-mate"] ;; if the overlap with "related_paired_F" is <= 10% set breeding_status to "no-mate"
  ]]

end

to Mate_Searching    ;; Adult Cabrera voles without a defined mate search within the patch for an available mate

 ask cabreras with [age >= maturation_age][  ;; asks cabreras aged or over the age of maturity to
    if not any? link-neighbors  ;;  if without mate

    [ifelse sex = "F"

      ;; females
      [if (last_reproduction = "n.a." or ticks - last_reproduction > t_new_estrus)[  ;; if the day of the last reproduction is equal to "n.a." or it has been longer than the time needed to re-enter the estrus
        let female self
        let female-radius sqrt (home_range_size / pi)
        let possible-mate nobody ;; create possible-mate temporary variable

        set possible-mate cabreras with [  ;; define characteristics of possible mate
          sex = "M" and  ;; male
          age >= maturation_age and  ;; older than maturation age
          not any? link-neighbors and  ;; without mate
          (member? "migrant" [parents_ID] of female or  ;; I am an immigrant or
            member? "founder" [parents_ID] of female and  ;; I am founder and
            not member? [who] of female parents_ID or  ;; the male is not my son or
            (not member? who [parents_ID] of female and  ;; the male is not one of my parents and
              parents_ID != [parents_ID] of female and ;; not my parents' son (my brother)
              not member? [who] of female parents_ID))]  ;; not my son

        let unrelated_F cabreras with [  ;; define characteristics of unrelated females
          sex = "F" and ;; female
          who != [who] of myself and ;; other than me
          not member? who [parents_ID] of myself and  ;; not one of my parents and
          parents_ID != [parents_ID] of myself and ;; not my parents' son (my brother)
          not member? [who] of myself parents_ID]  ;; not my son

        let related_paired cabreras with [  ;; define characteristics of related Cabreras with mate
          who != [who] of myself and ;; other than me
          any? link-neighbors and  ;; with mate
          not member? "migrant" [parents_ID] of self and ;; not an immigrant
          (member? who [parents_ID] of myself or  ;; one of my parents and
            parents_ID = [parents_ID] of myself or ;; my parents' son (my brother)
            member? [who] of myself parents_ID)]  ;; my son

        let combined_10% (turtle-set unrelated_F related_paired) ;; joins "unrelated_F" and "related_paired" in the variable "combined_10%"

        let related_unpaired_F cabreras with [  ;; define characteristics of related females without mate
          sex = "F" and  ;; female
          who != [who] of myself and ;; other than me
          not any? link-neighbors and  ;; without mate
          not member? "migrant" [parents_ID] of self and ;; not an immigrant and
          (member? who [parents_ID] of myself or  ;; one of my parents and
            parents_ID = [parents_ID] of myself or ;; my parents' son (my brother)
            member? [who] of myself parents_ID)]  ;; my son

        if any? possible-mate [  ;; if any possible mate
          let female-location one-of colony with [count patches in-radius female-radius with [pcolor = black] < 1 and  ;; define a location where the margins of the home-range do not go outside the limits of the colony
            count homeranges with [member? name ([who] of possible-mate)] in-radius female-radius > (min_overlap_mate * [home_range_size] of female) and  ;; overlap > than "min_overlap_mate" with possible mate
            count homeranges with [member? name ([who] of combined_10%)] in-radius female-radius < (0.10 * [home_range_size] of female) and   ;; <10% overlap with "combined_10%"
            count homeranges with [member? name ([who] of related_unpaired_F)] in-radius female-radius < (0.80 * [home_range_size] of female)]  ;; <80% overlap with related females without mate


         if female-location != nobody [  ;; in case there are possible locations
            ask home_range [  ;; ask home-range patches
              if colored_home-ranges [set pcolor green]]  ;; set color green
            ask homeranges with [name = [who] of myself] [die]  ;; ask homeranges with name = my ID to die
            move-to female-location  ;; move to the defined location
            set home_range patch-set patches in-radius female-radius  ;; define an agentset with all home-range patches
            ask home_range [  ;; ask home-range patches
              if colored_home-ranges [set pcolor pink]  ;; set color pink
              sprout-homeranges 1 [ ;; to create in each patch an individual of the breed "homeranges" and
              hide-turtle  ;; hide the "homeranges" (not visible on the map)
              set name [who] of female]]  ;; set the name of "homeranges" as the cabrera ID
            create-link-with min-one-of possible-mate [distance myself]  ;; form a mate with the closest possible-mate
            ask related_unpaired_F [
              set female-radius sqrt (home_range_size / pi)  ;; calculate the home-range radius
              if count homeranges with [name = [who] of female] in-radius female-radius > (0.10 * home_range_size) [set breeding_status "overlaper"]]] ;; if the overlap with "related_paired_F" is> 10% set breeding_status to "overlaper"
      ]]]


      ;; male
      [let male self
        let male-radius sqrt (home_range_size / pi)  ;; calculate the home-range radius
        let possible-mate nobody ;; create possible-mate temporary variable

        set possible-mate cabreras with [  ;; define characteristics of possible mate
          sex = "F" and  ;; female
          age >= maturation_age and  ;; older than maturation age and
          not any? link-neighbors and  ;; without mate and
          breeding_status != "helper" and  ;; not an "helper" and
          breeding_status != "overlaper" and  ;; not an "overlaper" and
          (member? "migrant" [parents_ID] of male or  ;; I am an immigrant or
            member? "founder" [parents_ID] of male and  ;; I am founder and
            not member? [who] of male parents_ID or  ;; not my son or
            (not member? who [parents_ID] of male and  ;; one of my parents and
              parents_ID != [parents_ID] of male and ;; not my parents' son (my brother) and
              not member? [who] of male parents_ID))]  ;; not my son

      let males cabreras with [  ;; define male characteristics
        sex = "M" and ;; male
        who != [who] of myself] ;; other than me


       let related_paired_F cabreras with [  ;; define characteristics of related females with mate
          sex = "F" and  ;; female and
          any? link-neighbors and  ;; with mate and
          not member? "migrant" [parents_ID] of self and ;; not an immigrant and
          (member? who [parents_ID] of myself or  ;; one of my parents or
            parents_ID = [parents_ID] of myself or ;; my parents' son (my brother) or
            member? [who] of myself parents_ID)]  ;; my son

       let combined_10% (turtle-set males  related_paired_F)  ;; joins "males" and "related_paired_F" in the variable "combined_10%"

        if any? possible-mate [  ;; if any possible mate
          let male-location one-of colony with [count patches in-radius male-radius with [pcolor = black] < 1 and  ;; define a location where the margins of the home-range do not go outside the limits of the colony
            count homeranges with [member? name ([who] of possible-mate)] in-radius male-radius > (min_overlap_mate * [home_range_size] of male) and  ;; overlap > than "min_overlap_mate" with possible mate
            count homeranges with [member? name ([who] of combined_10%)] in-radius male-radius < (0.10 * [home_range_size] of male)]  ;; <10% overlap with "combined_10%"

         if male-location != nobody [  ;; in case there are possible locations
            ask home_range [  ;; ask home-range patches
              if colored_home-ranges [set pcolor green]]  ;; set color green
            ask homeranges with [name = [who] of myself] [die]  ;; ask homeranges with name = my ID to die
            move-to male-location  ;; move to the defined location
            set home_range patch-set patches in-radius male-radius  ;; define an agentset with all home-range patches
            ask home_range [  ;; ask home-range patches
              if colored_home-ranges [set pcolor blue]  ;; set color blue
              sprout-homeranges 1 [ ;; to create in each patch an individual of the breed "homeranges" and
              hide-turtle  ;; hide the "homeranges" (not visible on the map)
              set name [who] of male]]  ;; set the name of "homeranges" as the cabrera ID
            create-link-with min-one-of possible-mate [distance myself]   ;; form a mate with the closest possible-mate
            ask possible-mate with [ ;; as possible mate with
              not any? link-neighbors][  ;; witout mate
              let female-radius sqrt (home_range_size / pi)  ;; calculate the home-range radius
              set related_paired_F cabreras with [  ;; define characteristics of related females with mate
                sex = "F" and ;; female
                not member? "migrant" [parents_ID] of self and ;; not an immigrant
                any? link-neighbors and  ;; with mate
                who != [who] of myself and ;; other than me
                (member? who [parents_ID] of myself or  ;; one of my parents and
                  parents_ID = [parents_ID] of myself or ;; my parents' son (my brother)
                  member? [who] of myself parents_ID)]  ;; my son
              if count homeranges with [member? name ([who] of related_paired_F)] in-radius female-radius > (0.10 * home_range_size) [ ;; if the overlap with "related_paired_F" is > 10%
                set breeding_status "overlaper"]]] ;; set breeding_status to "overlaper"
    ]]]
  ]

  ask cabreras with [age >= maturation_age] [ifelse any? link-neighbors ;; asks cabreras aged or over the maturation age with partner
    [set t_without_mate 0  ;; define "t_without_mate" as 0 and
     set breeding_status reduce word ([who] of link-neighbors)]  ;; defines the variable "mate" as the partner ID
    [set t_without_mate t_without_mate + 1]] ;; if don't have a mate add +1 to "t_without_mate"

end

to Reproduction ;;  Reproduction

  ask cabreras with [
    sex = "F" and
    age >= maturation_age and
    breeding_status != "helper" and  ;; not an "helper"
    (last_reproduction = "n.a." or ticks - last_reproduction > t_new_estrus)][  ;; the day of the last reproduction is equal to "n.a." or it has been longer than the time needed to re-enter the estrus

    if random-bernoulli reproduction_prob [  ;; check according to the probability of reproduction if there is reproduction or not, if there is

      let female self

      let possible_mates cabreras with [ ;; define possible-mate characteristics
        sex = "M" and  ;; male
        age >= maturation_age and  ;; older than maturation age
        (member? "migrant" [parents_ID] of female or  ;; I am an immigrant or
          member? "founder" [parents_ID] of female and  ;; I am founder and
          not member? [who] of myself parents_ID or  ;; the male is not son or
          (not member? who [parents_ID] of female and  ;; the male is not one of my parents and
            parents_ID != [parents_ID] of female and ;; not my parents' son (my brother) and
            not member? [who] of myself parents_ID))]   ;; the male is not son

      if any? possible_mates [  ;; if any possible mates
        let homeranges-dads homeranges-on [home_range] of female  ;; define "homeranges-dads" as "homeranges" in my home-range

        if any? homeranges-dads with [member? name [who] of possible_mates][ ;; if any of the "homeranges-dads" belong to one of the "possible_mates"
          ifelse any? link-neighbors [  ;; differentiate whether I have a defined mate or not

  ;; with mate
            let homeranges-dad one-of homeranges-dads with [  ;; choose one of the "homeranges-dads" with
            member? name [who] of possible_mates]  ;; ID equal to one of the "possible_mates"

            let dad cabrera ([name] of homeranges-dad)  ;; define as father, the male with the same ID as the "homeranges-dad"
            set last_reproduction ticks  ;; set the last_reproduction as the current week
            set give_birth ticks + t_gestation  ;; set the birth week to "t_gestation" weeks from now
            if n_litters = "n.a." [set n_litters 0]  ;; if n_litters is equal to "n.a." set to 0
            set father_ID [who] of dad  ;; set  father_ID variable as the ID of thr father of future offspring
            set father_genes [my-genes] of dad  ;; set father_genes variable as the genes of the father of future offspring
            ask dad [  ;; ask father
              set last_reproduction ticks]  ;; set the last_reproduction as the current week

            ifelse link-neighbor? dad [set n_rep_with_pair n_rep_with_pair + 1][  ;; if F and M are a defined mate add +1 to "n_rep_with_pair"
              ifelse any? link-neighbors [ask dad [ifelse any? link-neighbors [set n_rep_out_pair_FM n_rep_out_pair_FM + 1] [set n_rep_out_pair_F n_rep_out_pair_F + 1]]] [ ;; if F and M are not a mate and, F has mate and M also adds +1 to "n_rep_out_pair_FM", F has mate and M does not add +1 to "n_rep_out_pair_F"
                ask dad [ifelse any? link-neighbors [set n_rep_out_pair_M n_rep_out_pair_M + 1] [set n_rep_without_pair n_rep_without_pair + 1]]]]  ;;  if F and M are not a mate and, F has no mate and M has add +1 "n_rep_out_pair_M, F and M do not have a mate add +1" n_rep_without_pair "
          ]

  ;; without mate
          [let mates_overlap count home_range with [any? homeranges-here with [member? name [who] of possible_mates]]  ;; defines the temporary variable "mates_overlap" as the number of patches in the home-range overlapping with "possible-mates"
            set mates_overlap mates_overlap / home_range_size  ;; divide "mates_overlap" by the number of patches in the home-range (percentage of overlapping patches)
            if random-bernoulli mates_overlap [  ;; check according to the percentage of overlap if there is reproduction or not, if there is

              let homeranges-dad one-of homeranges-dads with [  ;; choose one of the "homeranges-dads" with
                member? name [who] of possible_mates]  ;; ID equal to one of the "possible_mates"

              let dad cabrera ([name] of homeranges-dad)  ;; define as father, the male with the same ID as the "homeranges-dad"
              set last_reproduction ticks  ;; set the last_reproduction as the current week
              set give_birth ticks + t_gestation  ;; set the birth week to "t_gestation" weeks from now
              if n_litters = "n.a." [set n_litters 0]  ;; if n_litters is equal to "n.a." set to 0
              set father_ID [who] of dad  ;; set  father_ID variable as the ID of thr father of future offspring
              set father_genes [my-genes] of dad  ;; set father_genes variable as the genes of the father of future offspring
              ask dad [  ;; ask father
                set last_reproduction ticks]  ;; set the last_reproduction as the current week

              ifelse link-neighbor? dad [set n_rep_with_pair n_rep_with_pair + 1][  ;; if F and M are a defined mate add +1 to "n_rep_with_pair"
                ifelse any? link-neighbors [ask dad [ifelse any? link-neighbors [set n_rep_out_pair_FM n_rep_out_pair_FM + 1] [set n_rep_out_pair_F n_rep_out_pair_F + 1]]] [ ;; if F and M are not a mate and, F has mate and M also adds +1 to "n_rep_out_pair_FM", F has mate and M does not add +1 to "n_rep_out_pair_F"
                  ask dad [ifelse any? link-neighbors [set n_rep_out_pair_M n_rep_out_pair_M + 1] [set n_rep_without_pair n_rep_without_pair + 1]]]]  ;; if F and M are not a mate and, F has no mate and M has add +1 "n_rep_out_pair_M, F and M do not have a mate add +1" n_rep_without_pair "
          ]]
  ]]]]

end

to Birthing  ;; Pregnant Cabrera voles, who have the current time step set to give birth, generate between 3 and 5 cubs, that will be added to the model in the same habitat cell as the mother

  ask cabreras [
    if give_birth = ticks [  ;; if the current week is the birth week
      let mom self
      let genes-mom [my-genes] of mom
      let genes-dad [father_genes] of mom
      repeat litter-size [ask mom [  ;; repeat next procedure as many times as the calculated value for litter-size (n cubs)
        hatch 1 [  ;; give birth to a cub with
          custom-cabrera
          set age 0
          set parents_ID  sentence [father_ID] of mom [who] of mom  ;; set the parents' IDs
          set my-genes cross-genotype (genes-dad) (genes-mom)  ;; defines as "my-genes" a cross between my parents' genes
          set genes (word my-genes) ;; turns "my-genes" into a "phrase" and saves it as "genes"
          set genes substring (genes) 1 63  ;; select only the part of the "phrase" of interest
          set n_born n_born + 1  ;; add +1 to "n_born"
        ]]
      ]
      if n_litters = "n.a." [set n_litters 0]  ;; if "n_litters" is "n.a.", set to 0
      set n_litters n_litters + 1  ;; add 1 to n_litters
      set give_birth "n.a."  ;; set give_birth as "n.a."
      set father_ID "n.a."  ;; set father_ID as "n.a."
      set father_genes "n.a."  ;; set father_genes as "n.a."
    ]
  ]

end

to Emigration  ;; Cabrera voles older than the defined nest leaving age, who have no defined ma-te, and, in the case of females, don´t have lactating cubs, decide whether to emigrate in the current time step or not.

  ask cabreras [
    if age >= nest_leave_age and  ;; older than nest_leave_age
    not any? link-neighbors [  ;; without mate
      ifelse (sex =  "F")
      ;; Females
        [if last_reproduction = "n.a." or ticks - last_reproduction > t_lactation [  ;; the day of the last reproduction is equal to "n.a." or it has been longer than thet_lactation
          if random-bernoulli emigration_prob [  ;; check if according to the probability of emigrating the female will emigrate or not, if yes
            if colored_home-ranges [ask home_range [set pcolor green]]  ;; ask home-range patches to set color green
            ask homeranges with [name = [who] of myself] [die]  ;; ask homeranges with name = my ID to die
            set n_normal_out n_normal_out + 1  ;; add +1 to the variable "n_normal_out"
            set n_out_13w n_out_13w + 1  ;; add +1 to the variable "n_normal_out_13w"
            die]]]  ;; die (equivalent to leaving the patch)
      ;; Males
        [if random-bernoulli emigration_prob [  ;; check if according to the probability of emigrating the male will emigrate or not, if yes
          if colored_home-ranges [ask home_range [set pcolor green]]  ;; ask home-range patches to set color green
          ask homeranges with [name = [who] of myself] [die]  ;; ask homeranges with name = my ID to die
          set n_normal_out n_normal_out + 1  ;; add +1 to the variable "n_normal_out"
          set n_out_13w n_out_13w + 1  ;; add +1 to the variable "n_normal_out_13w"
          die]]  ;; die (equivalent to leaving the patch)

      if colored_home-ranges [ask cabreras [ifelse (sex = "F")[ask home_range [set pcolor pink]][ask home_range [set pcolor blue]]]]  ;; ask cabreras to redefine the colors of the home-range patches
]]

end

to Immigration ;; At each time step, an immigrant can enter and try to establish a territory in the local patch.

  if random-bernoulli immigration_prob [  ;; check if, according to the probability of immigration, there is immigration or not, if yes
    let migrant-sex one-of ["M" "F"]  ;; set male or female
    ifelse migrant-sex = "F"
   ;; Females
    [let migrant-area create_female_area  ;; define temporary variable of home-range area
      let migrant-radius sqrt (migrant-area / pi)  ;; calculates the radius of the home-range

        create-cabreras 1 [  ;; create a cabrera
        custom-cabrera  ;; custom-cabrera definitions
        set sex "F"  ;; female
        set color 133  ;; color pink
        set my-genes create-genes  ;; create genotype
        set genes (word my-genes)
        set genes substring (genes) 1 63
        set parents_ID sentence "migrant" ""  ;; set parents_ID as a migrant
        set age (nest_leave_age + random (max_age - nest_leave_age))  ;; set age between nest_leave_age and max_age

        let females cabreras with [  ;; define characteristics of "females"
        sex = "F" and ;; female
        who != [who] of myself] ;; other than me

        let migrant-location []  ;; set temporary location variable
        set migrant-location one-of colony with [count patches in-radius migrant-radius with [pcolor = black] < 1 and  ;; ;; define a location where the margins of the home-range do not go outside the limits of the colony and
            count homeranges with [member? name ([who] of females)] in-radius migrant-radius < (0.10 * migrant-area)]  ;; <10% overlap with females

          ifelse migrant-location != nobody  ;; differentiate cases where there are possible locations or not
            [move-to migrant-location  ;; if there is a location, move to that location
              set home_range patch-set patches in-radius migrant-radius
              set home_range_size count home_range
              let me self
              ask home_range [
                if colored_home-ranges [set pcolor pink]
                sprout-homeranges 1 [
                  hide-turtle
                  set name [who] of me]]
              set n_in n_in + 1  ;; add +1 to the "n_in" variable
              set n_in_13w n_in_13w + 1 ;; add +1 to the "n_in_13w" variable
          ]
          [set n_try_in n_try_in + 1  ;; in case there is no location, add +1 to the variable "n_try_in"
            die] ;; die (equivalent to not settling in the patch due to lack of space)
    ]]

   ;; Males
    [let migrant-area create_male_area  ;; define temporary variable of home-range area
      let migrant-radius sqrt (migrant-area / pi)  ;; calculates the radius of the home-range

      create-cabreras 1 [  ;; create a cabrera
        custom-cabrera  ;; custom-cabrera definitions
        set sex "M"  ;; male
        set color 93 ;; color blue
        set my-genes create-genes   ;; create genotype
        set genes (word my-genes)
        set genes substring (genes) 1 63
        set parents_ID sentence "migrant" ""  ;; set parents_ID as a migrant
        set age (nest_leave_age + random (max_age - nest_leave_age))  ;; set age between nest_leave_age and max_age

        let males cabreras with [  ;; define characteristics of "males"
        sex = "M" and ;; ser macho
        who != [who] of myself] ;; other than me

        let migrant-location []  ;; set temporary location variable
        set migrant-location one-of colony with [count patches in-radius migrant-radius with [pcolor = black] < 1 and  ;; ;; define a location where the margins of the home-range do not go outside the limits of the colony and
          count homeranges with [member? name ([who] of males)] in-radius migrant-radius < (0.10 * migrant-area)]   ;; <10% overlap with males

          ifelse migrant-location != nobody  ;; differentiate cases where there are possible locations or not
            [move-to migrant-location  ;; if there is a location, move to that location
              set home_range patch-set patches in-radius migrant-radius
              set home_range_size count home_range
              let me self
              ask home_range [
                if colored_home-ranges [set pcolor blue]
                sprout-homeranges 1 [
                  hide-turtle
                  set name [who] of me]] ;
              set n_in n_in + 1  ;; add +1 to the "n_in" variable
              set n_in_13w n_in_13w + 1 ;; add +1 to the "n_in_13w" variable
          ]
          [set n_try_in n_try_in + 1  ;; in case there is no location, add +1 to the variable "n_try_in"
            die]  ;; die (equivalent to not settling in the patch due to lack of space)
    ]]
  ]

end

to Survival  ;; sobrevivencia

  ask cabreras with [age >= maturation_age][  ;; asks cabreras aged over or equal to the maturation_age
    if random-bernoulli survival_adult [  ;; check if according to the probability of dying, will die or not, if yes
      if last_reproduction != "n.a." and (ticks - last_reproduction <= t_gestation + t_lactation) [  ;; if the day of the last reproduction is not equal to "n.a." or it has not yet passed more than the time needed to reenter estrus
        ask cabreras-on patch-here [if age <= t_lactation [die]]]  ;; asks Cabreras at the same place at the age of lactation (cubs) to die
      if colored_home-ranges [ask home_range [set pcolor green]]  ;; ask home-range patches to set color green
      ask homeranges with [name = [who] of myself] [die]  ;; ask homeranges with name = my ID to die
      set n_die n_die + 1  ;; add +1 to the variable "n_die"
      die]] ;; die
  if colored_home-ranges [ask cabreras [ifelse (sex = "F")[ask home_range [set pcolor pink]][ask home_range [set pcolor blue]]]]  ;; ask cabreras to redefine the colors of the home-range patches

  ask cabreras with [age >= nest_leave_age and age < maturation_age][  ;; asks Cabreras older than or equal to the nest_leaving_age and iferior to the maturation_age
    if random-bernoulli survival_sub-adult [  ;; check if according to the probability of dying, will die or not, if yes
      if colored_home-ranges [ask home_range [set pcolor green]]  ;; ask home-range patches to set color green para definir a cor verde
      ask homeranges with [name = [who] of myself] [die]  ;; ask homeranges with name = my ID to die
      set n_die n_die + 1  ;; add +1 to the variable "n_die"
      die]] ;; die
  if colored_home-ranges [ask cabreras [ifelse (sex = "F")[ask home_range [set pcolor pink]][ask home_range [set pcolor blue]]]]  ;; ask cabreras to redefine the colors of the home-range patches

  ask cabreras with [age > 0 and age < nest_leave_age][  ;; asks Cabreras under the nest_leaving_age
    if random-bernoulli survival_juvenile [ ;; check if according to the probability of dying, will die or not, if yes
      set n_die n_die + 1  ;; add +1 to the variable "n_die"
      die]] ;; die

end


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  general procedures  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


to Variables_Updating    ;; update probabilities of immigration, emigration and reproduction

  set immigration_prob ((ts-get ts (start_date) "max_immigration" - 0.05) * Patch_Connectivity) + 0.05  ;; equation = ((max-min) * conectivity) + min
  set reproduction_prob (((ts-get ts (start_date) "max_rep") - (ts-get ts (start_date) "min_rep")) * Patch_Quality) + ts-get ts (start_date) "min_rep"  ;; equation = ((max-min) * hab_quality) + min
  set emigration_prob ((0.177 - 0.075) * Patch_Connectivity) + 0.075  ;; equation = ((max-min) * conectivity) + min

end

to Outputs_Collection   ;; after the start of the simulation, every three months (13 time steps), 14 population metrics are collected

  set n_males count cabreras with[age > t_lactation and sex = "M"]  ;; update n_males
  set n_females count cabreras with[age > t_lactation and sex = "F"]  ;; update n_females

  ifelse (n_females + n_males) > 0 [set Sex-Ratio n_males / (n_females + n_males)][set Sex-Ratio 0.5]  ;; update sex-ratio

  if member? ticks [14 27 40 53 66 79 92][  ;; if it is one of these weeks
    set Extinction 0
    set Recolonization 0
  ]

  if count cabreras = 0 and N_last_week > 0 [ ;; if extinction occurred
    set t_extinction t_extinction + 1  ;; add +1 to t_extinction
    set Extinction Extinction + 1]  ;; ad +1 to Extinction

  if N_last_week = 0 and count cabreras > 0 [  ;; if recolonization occurred
    set t_recolonization t_recolonization + 1  ;; add +1 to t_recolonization
    set Recolonization Recolonization + 1]  ;; add +1 to Recolonization

  if member? ticks [13 26 39 52 65 78 91 104] and count cabreras > 0 [  ;; if it is one of these weeks and there are Cabreras in the patch
    ifelse count cabreras with [age > t_lactation] > 0 [set Residency mean [residence_time] of cabreras with [age > t_lactation]][set Residency 0]
    set Density (count cabreras with[age > t_lactation] / (Patch_Size * 0.0001))
    ifelse (n_rep_with_pair + n_rep_without_pair + n_rep_out_pair_F + n_rep_out_pair_M + n_rep_out_pair_FM) > 0 [set Monogamy (n_rep_with_pair / (n_rep_with_pair + n_rep_without_pair + n_rep_out_pair_F + n_rep_out_pair_M + n_rep_out_pair_FM))][set Monogamy 1]
    ifelse (count cabreras with [residence_time <= 12]) > 0 [set LRER (count cabreras with [residence_time <= 12 and residence_time = age] - count cabreras with [residence_time <= 12 and residence_time != age]) / count cabreras with [residence_time <= 12]][set LRER 0]
    set Recruitment ((count cabreras with [residence_time <= 12]) / (count cabreras))
    ifelse (n_in_13w + n_out_13w) > 0 [set MER (n_in_13w - n_out_13w) / (n_in_13w + n_out_13w)][set MER 0]
    genetic_outputs_calculation  ;; perform genetic_outputs_calculation
    ]

  if member? ticks [13 26 39 52 65 78 91 104] and count cabreras = 0 [ ;; if it is one of these weeks and there are no Cabreras in the patch
    set Residency 0
    set Density 0
    set Monogamy 1
    set LRER 0
    set Recruitment 0
    set MER 0
    set N_alleles 0
    set HO 0
    set HE 0
    set Fis 0
    set Relatedness 0
  ]

  if ticks = 13 [
    set t_extinction_13 t_extinction
    set t_recolonization_13 t_recolonization
    set Extinction_13 Extinction
    set Recolonization_13 Recolonization
    set Density_13 Density
    set Sex-Ratio_13 Sex-Ratio
    set Monogamy_13 Monogamy
    set Residency_13 Residency
    set MER_13 MER
    set Recruitment_13 Recruitment
    set LRER_13 LRER
    set N_alleles_13 N_alleles
    set HE_13 HE
    set HO_13 HO
    set Fis_13 Fis
    set Relatedness_13 Relatedness
  ]

  if ticks = 26 [
    set t_extinction_26 t_extinction
    set t_recolonization_26 t_recolonization
    set Extinction_26 Extinction
    set Recolonization_26 Recolonization
    set Density_26 Density
    set Sex-Ratio_26 Sex-Ratio
    set Monogamy_26 Monogamy
    set Residency_26 Residency
    set MER_26 MER
    set Recruitment_26 Recruitment
    set LRER_26 LRER
    set N_alleles_26 N_alleles
    set HE_26 HE
    set HO_26 HO
    set Fis_26 Fis
    set Relatedness_26 Relatedness
  ]

  if ticks = 39 [
    set t_extinction_39 t_extinction
    set t_recolonization_39 t_recolonization
    set Extinction_39 Extinction
    set Recolonization_39 Recolonization
    set Density_39 Density
    set Sex-Ratio_39 Sex-Ratio
    set Monogamy_39 Monogamy
    set Residency_39 Residency
    set MER_39 MER
    set Recruitment_39 Recruitment
    set LRER_39 LRER
    set N_alleles_39 N_alleles
    set HE_39 HE
    set HO_39 HO
    set Fis_39 Fis
    set Relatedness_39 Relatedness
  ]

  if ticks = 52 [
    set t_extinction_52 t_extinction
    set t_recolonization_52 t_recolonization
    set Extinction_52 Extinction
    set Recolonization_52 Recolonization
    set Density_52 Density
    set Sex-Ratio_52 Sex-Ratio
    set Monogamy_52 Monogamy
    set Residency_52 Residency
    set MER_52 MER
    set Recruitment_52 Recruitment
    set LRER_52 LRER
    set N_alleles_52 N_alleles
    set HE_52 HE
    set HO_52 HO
    set Fis_52 Fis
    set Relatedness_52 Relatedness
  ]

  if ticks = 65 [
    set t_extinction_65 t_extinction
    set t_recolonization_65 t_recolonization
    set Extinction_65 Extinction
    set Recolonization_65 Recolonization
    set Density_65 Density
    set Sex-Ratio_65 Sex-Ratio
    set Monogamy_65 Monogamy
    set Residency_65 Residency
    set MER_65 MER
    set Recruitment_65 Recruitment
    set LRER_65 LRER
    set N_alleles_65 N_alleles
    set HE_65 HE
    set HO_65 HO
    set Fis_65 Fis
    set Relatedness_65 Relatedness
  ]

  if ticks = 78 [
    set t_extinction_78 t_extinction
    set t_recolonization_78 t_recolonization
    set Extinction_78 Extinction
    set Recolonization_78 Recolonization
    set Density_78 Density
    set Sex-Ratio_78 Sex-Ratio
    set Monogamy_78 Monogamy
    set Residency_78 Residency
    set MER_78 MER
    set Recruitment_78 Recruitment
    set LRER_78 LRER
    set N_alleles_78 N_alleles
    set HE_78 HE
    set HO_78 HO
    set Fis_78 Fis
    set Relatedness_78 Relatedness
  ]

  if ticks = 91 [
    set t_extinction_91 t_extinction
    set t_recolonization_91 t_recolonization
    set Extinction_91 Extinction
    set Recolonization_91 Recolonization
    set Density_91 Density
    set Sex-Ratio_91 Sex-Ratio
    set Monogamy_91 Monogamy
    set Residency_91 Residency
    set MER_91 MER
    set Recruitment_91 Recruitment
    set LRER_91 LRER
    set N_alleles_91 N_alleles
    set HE_91 HE
    set HO_91 HO
    set Fis_91 Fis
    set Relatedness_91 Relatedness
  ]

  if ticks = 104 [
    set t_extinction_104 t_extinction
    set t_recolonization_104 t_recolonization
    set Extinction_104 Extinction
    set Recolonization_104 Recolonization
    set Density_104 Density
    set Sex-Ratio_104 Sex-Ratio
    set Monogamy_104 Monogamy
    set Residency_104 Residency
    set MER_104 MER
    set Recruitment_104 Recruitment
    set LRER_104 LRER
    set N_alleles_104 N_alleles
    set HE_104 HE
    set HO_104 HO
    set Fis_104 Fis
    set Relatedness_104 Relatedness
  ]

  if member? ticks [13 26 39 52 65 78 91][
    set n_in_13w 0
    set n_out_13w 0
    set n_rep_with_pair 0
    set n_rep_without_pair 0
    set n_rep_out_pair_F 0
    set n_rep_out_pair_M 0
    set n_rep_out_pair_FM 0
  ]

  set N_last_week count cabreras  ;; set N_last_week with the current number of Cabreras in the patch

end

to custom-cabrera  ;; default values for each cabrera variable

  set sex one-of ["M" "F"]  ;; set sex
  ifelse (sex = "F")[set color 133][set color 93]  ;; define color by sex: females = pink, males = blue
  set age maturation_age  ;; set age equal to maturation_age
  set home_range patch-set []  ;; define home-range as an empty agentset
  set home_range_size 0  ;; set the home-range size to 0
  set parents_ID sentence "founder" ""  ;; set as founder
  set residence_time 0 ;; set residence time to 0
  set breeding_status "no_mate"  ;; set breeding_status as no_mate
  set t_without_mate 0  ;; set t_without_mate to 0
  set n_litters "n.a."  ;; set n_litters as "n.a."
  set last_reproduction "n.a."  ;; set last_reproduction as "n.a."
  set give_birth "n.a."  ;; set give_birth as "n.a"
  set father_ID "n.a."  ;;  set father_ID as "n.a"
  set father_genes "n.a."  ;;  set father_genes as "n.a"

end

to-report create_male_area   ;; create the home-range area for males

  let result int(random-normal 535.64 327.29)  ;; defines a value for the area based on a normal distribution averaged over 535.64 e SD 327.29
  if result > Patch_Size [report create_male_area]  ;; checks if the generated value is not greater than the patch size
  if result < 123.60 or result > 1075.60 [report create_male_area]  ;; checks if the value generated is between 123.60 (minimum value recorded in the field) and 1075.60 (maximum value recorded in the field)
  report result  ;; reports the result generated that meets the previous conditions

end

to-report create_female_area   ;; create the home-range area for females

  let result int(random-normal 355.44 271.39)   ;; defines a value for the area based on a normal distribution averaged over 355.44 e SD 271.39
  if result > Patch_Size [report create_female_area]  ;; checks if the generated value is not greater than the patch size
  if result < 39.26 or result > 991.46 [report create_female_area]  ;; checks if the value generated is between 39.26 (minimum value recorded in the field) and 991.46 (maximum value recorded in the field)
  report result  ;; reports the result generated that meets the previous conditions

end

to-report create_female_founder_area  ;; create the home-range area for founder females

  let result int(random-normal 355.44 271.39)  ;; defines a value for the area based on a normal distribution averaged over 355.44 e SD 271.39
  if result > Patch_Size [report create_female_founder_area] ;; checks if the generated value is not greater than the patch size
  if result < 39.26 or result > 991.46 [report create_female_founder_area] ;; checks if the value generated is between 39.26 (minimum value recorded in the field) and 991.46 (maximum value recorded in the field)
  if min_overlap_mate * result > male_founder_area [report create_female_founder_area]  ;; checks if the male home-range area has at least 25% of the value generated for the female home-range
  report result  ;; reports the result generated that meets the previous conditions

end

to-report create_female_founder_location ;; defines the location of the founding female

  set female_founder_area create_female_founder_area  ;;
  set female_founder_radius sqrt (female_founder_area / pi)  ;; calculates the radius of the home-range
  let female-location one-of colony with [count patches in-radius female_founder_radius with [pcolor = black] < 1 and   ;; define a location where the margins of the home-range do not go outside the limits of the colony and
    count homeranges in-radius female_founder_radius >= (min_overlap_mate * female_founder_area)] ;; defines the location of the female in the patch (the female's home-range must overlap in the minimum "min_overlap_mate" of the male's home-range)

  ifelse female-location != nobody  [report female-location][report create_female_founder_location] ;; if there is no possible location, recalculate

end

to-report litter-size  ;; set the litter size

  let result int(random-normal 4 0.89) ;; defines a value based on a normal distribution averaged over  4 e SD 0.89, min. 3, max. 5
  if result < 3 or result > 5 [report litter-size]  ;; check if the generated value is between 3 (minimum registered value) and 5 (maximum registered value)
  report result  ;; reports the result generated that meets the previous conditions

end

to-report create-genes ;; defines the genotype based on all observed replications of each pair of alleles for each locus (randomly choosing one of the pairs of alleles per locus, equivalent to allele frequencies)

  let markers []  ;; defines the temporary variable "markers"
  file-open "input-genotypes-stocking.txt"  ;; open the file "input-genotypes-stocking.txt" with all the observed repetitions of each pair of alleles for each locus
  set markers (file-read)  ;; defines the variable "markers" as the content of the file
  file-close  ;; close the file
  set genotype []  ;; defines the "genotype" variable as null
  set genotype assign-genotype (markers)  ;; defines the "genotype" variable using the "assign-genotype" function
  report genotype  ;; report the variable "genotype"

end

to-report assign-genotype [markers] ;; define the locus (randomly choosing one of the pairs of alleles per locus, equivalent to allele frequencies)

  let locus []  ;; defines the temporary variable "locus"
  let bit 0  ;; sets the temporary variable "bit" to 0 (locus number)
  repeat length markers [  ;; repeats the next process as many times as the number of locus
    set locus one-of (item bit markers)  ;; defines "locus" as one of the possible allele pairs for that locus
    set genotype lput (locus) genotype  ;; adds the "locus" to the "genotype"
    set bit bit + 1 ;; add 1 to the variable "bit" (go to the next locus)
  ]
  report genotype  ;; report the variable "genotype"

end

to-report cross-genotype [ genotype1 genotype2 ]  ;; create the genotypes of cubs based on the genotype of the parents

  let new-genotype []  ;; defines the temporary variable  "new-genotype"
  let bit 0  ;; sets the temporary variable "bit" to 0 (locus number)
  repeat length genotype1  ;; repeats the next process as many times as the number of locus of genotype1
  [
    let choice random 4  ;; defines the temporary variable "choice" as a random number between 0 and 3
    if choice = 0  ;; if the random number generated is 0
    [ set new-genotype (lput (word(substring (item bit genotype1) 0 3) (substring (item bit genotype2) 0 3)) new-genotype)]  ;; defines the locus as the allele 1 of the genotype 1 and the allele 1 of the genotype 2 and add it to the genotype
    if choice = 1  ;; if the random number generated is 1
    [ set new-genotype (lput (word(substring (item bit genotype1) 0 3) (substring (item bit genotype2) 3 6)) new-genotype)]  ;; defines the locus as the allele 1 of the genotype 1 and the allele 2 of the genotype 2 and add it to the genotype
    if choice = 2  ;; if the random number generated is 2
    [ set new-genotype (lput (word(substring (item bit genotype1) 3 6) (substring (item bit genotype2) 0 3)) new-genotype)]  ;; defines the locus as the allele 2 of the genotype 1 and the allele 1 of the genotype 2 and add it to the genotype
    if choice = 3  ;; if the random number generated is 3
    [ set new-genotype (lput (word(substring (item bit genotype1) 3 6) (substring (item bit genotype2) 3 6)) new-genotype)]  ;; defines the locus as the allele 2 of the genotype 1 and the allele 2 of the genotype 2 and add it to the genotype
    set bit bit + 1  ;; add 1 to the variable "bit" (go to the next locus)
  ]
  report new-genotype  ;; report the variable "new-genotype"

end

to genetic_outputs_calculation ;; perform genetic outputs calculations with R-extension

  ifelse count cabreras > 1 [  ;; if there is more than one Cabrera
    (r:putagentdf "df.genes" cabreras "genes") ;; send data from genetic codes to R

    r:eval "source('C:/Users/Tiago/OneDrive/PHD/Microtus_cabrerae/Modelo_Paper_1/Function_Genetics.r')" ;; load function in R (set file location)

    let genetics r:get "x(df.genes)" ;; run the R function for my data and assign results to the temporary variable "genetics"

    set N_alleles item 0 genetics
    set HO item 1 genetics
    set HE item 2 genetics
    set Fis item 3 genetics
    set Relatedness item 4 genetics

    r:clear ;; remove R variables
    r:gc ;; clean memory
  ]
  [ ;; otherwise
    set N_alleles 0
    set HO 0
    set HE 0
    set Fis 0
    set Relatedness 0
  ]

end

to-report random-bernoulli [probability-true]  ;; function to define the occurrence or not of an action, according to a probability

  if (probability-true < 0.0 or probability-true > 1.0)  ;; if the probability of occurrence is less than 0 or greater than 1
    [type "warning in random-bernoulli: probability-true equals " print probability-true]  ;; displays error message

  ifelse random-float 1.0 < probability-true  ;; generate random number between 0 and 1
    [report true][report false]  ;; if the value generated is less than the probability of occurrence it returns "true" otherwise it returns "false"

end
@#$#@#$#@
GRAPHICS-WINDOW
363
42
857
537
-1
-1
6.0
1
10
1
1
1
0
0
0
1
-40
40
-40
40
1
1
1
ticks
10000.0

BUTTON
27
59
100
92
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
118
59
191
92
go
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

INPUTBOX
16
255
124
315
Patch_Size
2500.0
1
0
Number

MONITOR
1184
244
1277
281
N_forced_out
n_forced_out
0
1
9

MONITOR
1091
244
1184
281
N_normal_out
n_normal_out
17
1
9

MONITOR
1091
207
1184
244
N_try_in
n_try_in
17
1
9

MONITOR
1184
170
1277
207
N_die
n_die
17
1
9

MONITOR
1091
170
1184
207
N_born
N_born
17
1
9

MONITOR
1184
207
1277
244
N_in
n_in
17
1
9

MONITOR
1184
392
1277
429
N_rep_out_pair_F
n_rep_out_pair_F
0
1
9

MONITOR
1184
355
1277
392
N_rep_without_pair
n_rep_without_pair
0
1
9

MONITOR
1091
355
1184
392
N_rep_with_pair
n_rep_with_pair
17
1
9

MONITOR
1091
392
1184
429
N_rep_out_pair_M
n_rep_out_pair_M
0
1
9

MONITOR
1091
429
1184
466
N_rep_out_pair_FM
N_rep_out_pair_FM
0
1
9

SWITCH
24
486
206
519
Colored_Home-Ranges
Colored_Home-Ranges
1
1
-1000

MONITOR
1091
133
1184
170
N_males
n_males
17
1
9

MONITOR
1184
133
1277
170
N_females 
N_females
17
1
9

MONITOR
967
179
1048
224
Sex-Ratio
Sex-Ratio
2
1
11

MONITOR
886
224
967
269
Residency
Residency
2
1
11

MONITOR
886
179
967
224
Density
Density
2
1
11

MONITOR
1091
318
1184
355
T_extinction
t_extinction
17
1
9

MONITOR
967
224
1048
269
Monogamy
Monogamy
2
1
11

MONITOR
967
269
1048
314
Recruitment
Recruitment
2
1
11

MONITOR
1091
281
1184
318
N_in_13w
n_in_13w
17
1
9

MONITOR
1184
281
1277
318
N_out_13w
n_out_13w
17
1
9

MONITOR
886
269
967
314
MER
MER
2
1
11

TEXTBOX
897
99
1047
118
Output Parameters
16
0.0
0

TEXTBOX
37
222
260
262
Patch Attributes (editable)
16
0.0
1

TEXTBOX
1116
99
1266
118
Other Parameters
16
0.0
1

TEXTBOX
42
115
192
134
Schedule
16
0.0
1

MONITOR
886
314
967
359
LRER
LRER
2
1
11

MONITOR
967
314
1048
359
N_Alleles
N_alleles
2
1
11

MONITOR
967
359
1048
404
NIL
HO
2
1
11

MONITOR
886
359
967
404
NIL
HE
2
1
11

MONITOR
886
404
967
449
NIL
Fis
2
1
11

MONITOR
27
142
84
187
year
time:get \"year\" start_date
17
1
11

MONITOR
83
142
140
187
month
time:get \"month\" start_date
17
1
11

MONITOR
139
142
195
187
day
time:get \"day\" start_date
17
1
11

MONITOR
234
382
342
427
Immigration_prob
immigration_prob
3
1
11

MONITOR
18
382
126
427
Reproduction_prob
reproduction_prob
3
1
11

MONITOR
126
382
234
427
Emigration_prob
Emigration_prob
17
1
11

MONITOR
1184
318
1277
355
T_recolonization
t_recolonization
17
1
9

MONITOR
886
134
967
179
Extinction
Extinction
17
1
11

MONITOR
967
134
1048
179
Recolonization
Recolonization
17
1
11

INPUTBOX
124
255
232
315
Patch_Quality
0.5
1
0
Number

INPUTBOX
232
255
340
315
Patch_Connectivity
0.5
1
0
Number

MONITOR
967
404
1048
449
NIL
Relatedness
2
1
11

TEXTBOX
37
348
208
388
Variables Probabilities
16
0.0
1

TEXTBOX
36
451
186
471
Viewing Options
16
0.0
1

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

mouse side
false
0
Polygon -7500403 true true 38 162 24 165 19 174 22 192 47 213 90 225 135 230 161 240 178 262 150 246 117 238 73 232 36 220 11 196 7 171 15 153 37 146 46 145
Polygon -7500403 true true 289 142 271 165 237 164 217 185 235 192 254 192 259 199 245 200 248 203 226 199 200 194 155 195 122 185 84 187 91 195 82 192 83 201 72 190 67 199 62 185 46 183 36 165 40 134 57 115 74 106 60 109 90 97 112 94 92 93 130 86 154 88 134 81 183 90 197 94 183 86 212 95 211 88 224 83 235 88 248 97 246 90 257 107 255 97 270 120
Polygon -16777216 true false 234 100 220 96 210 100 214 111 228 116 239 115
Circle -16777216 true false 246 117 20
Line -7500403 true 270 153 282 174
Line -7500403 true 272 153 255 173
Line -7500403 true 269 156 268 177

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.2.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="experiment" repetitions="1" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <metric>count turtles</metric>
    <enumeratedValueSet variable="Area">
      <value value="3500"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="colored_home-ranges">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="inbreeding_avoidance">
      <value value="true"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
