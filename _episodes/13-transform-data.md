---
# Please do not edit this file directly; it is auto generated.
# Instead, please edit 13-transform-data.md in _episodes_rmd/
source: Rmd
title: "Data Transformations"
teaching: 0
exercises: 0
questions:
- "How do I obtain transform data?"
objectives:
- "Add new columns to a data frame that are functions of existing columns with `mutate`."
- "Use the split-apply-combine concept for data analysis."
- "Use `summarize`, `group_by`, and `count` to split a data frame into groups of observations, apply summary statistics for each group, and then combine the results."
keypoints:
- ""
- ""
---

### Mutate

Frequently you'll want to create new columns based on the values in existing
columns, for example to do unit conversions, or to find the ratio of values in two
columns. For this we'll use `mutate()`.

To create a new column of weight in kg:


```r
tumor %>%
  mutate(weight_kg = Size / 1000)
```

```
## Error in tumor %>% mutate(weight_kg = Size/1000): could not find function "%>%"
```

You can also create a second new column based on the first new column within the same call of `mutate()`:


```r
tumor %>%
  mutate(weight_kg = weight / 1000,
         weight_lb = weight_kg * 2.2)
```

```
## Error in tumor %>% mutate(weight_kg = weight/1000, weight_lb = weight_kg * : could not find function "%>%"
```

If this runs off your screen and you just want to see the first few rows, you
can use a pipe to view the `head()` of the data. (Pipes work with non-**`dplyr`**
functions, too, as long as the **`dplyr`** or `magrittr` package is loaded).


```r
tumor %>%
  mutate(weight_kg = weight / 1000) %>%
  head()
```

```
## Error in tumor %>% mutate(weight_kg = weight/1000) %>% head(): could not find function "%>%"
```

The first few rows of the output are full of `NA`s, so if we wanted to remove
those we could insert a `filter()` in the chain:


```r
tumor %>%
  filter(!is.na(weight)) %>%
  mutate(weight_kg = weight / 1000) %>%
  head()
```

```
## Error in tumor %>% filter(!is.na(weight)) %>% mutate(weight_kg = weight/1000) %>% : could not find function "%>%"
```

`is.na()` is a function that determines whether something is an `NA`. The `!`
symbol negates the result, so we're asking for every row where weight *is not* an `NA`.

> ### Challenge {.challenge}
>
>  Create a new data frame from the `surveys` data that meets the following
>  criteria: contains only the `species_id` column and a new column called
>  `hindfoot_cm` containing the `hindfoot_length` values converted to centimeters.
>  In this `hindfoot_cm` column, there are no `NA`s and all values are less
>  than 3.
>
>  **Hint**: think about how the commands should be ordered to produce this data frame!
> 
> 
> ```r
> surveys_hindfoot_cm <- surveys %>%
>     filter(!is.na(hindfoot_length)) %>%
>     mutate(hindfoot_cm = hindfoot_length / 10) %>%
>     filter(hindfoot_cm < 3) %>%
>     select(species_id, hindfoot_cm)
> ```
 


### Split-apply-combine data analysis and the `summarize()` function

Many data analysis tasks can be approached using the *split-apply-combine*
paradigm: split the data into groups, apply some analysis to each group, and
then combine the results. **`dplyr`** makes this very easy through the use of the
`group_by()` function.


#### The `summarize()` function

`group_by()` is often used together with `summarize()`, which collapses each
group into a single-row summary of that group.  `group_by()` takes as arguments
the column names that contain the **categorical** variables for which you want
to calculate the summary statistics. So to compute the mean `weight` by sex:


```r
tumor %>%
  group_by(sex) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))
```

```
## Error in tumor %>% group_by(sex) %>% summarize(mean_weight = mean(weight, : could not find function "%>%"
```

You may also have noticed that the output from these calls doesn't run off the
screen anymore. It's one of the advantages of `tbl_df` over data frame.

You can also group by multiple columns:


```r
tumor %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE)) %>% 
  tail()
```

```
## Error in tumor %>% group_by(sex, species_id) %>% summarize(mean_weight = mean(weight, : could not find function "%>%"
```

Here, we used `tail()` to look at the last six rows of our summary. Before, we had 
used `head()` to look at the first six rows. We can see that the `sex` column contains 
`NA` values because some animals had escaped before their sex and body weights 
could be determined. The resulting `mean_weight` column does not contain `NA` but 
`NaN` (which refers to "Not a Number") because `mean()` was called on a vector of 
`NA` values while at the same time setting `na.rm = TRUE`. To avoid this, we can 
remove the missing values for weight before we attempt to calculate the summary 
statistics on weight. Because the missing values are removed first, we can omit 
`na.rm = TRUE` when computing the mean:


```r
tumor %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight))
```

```
## Error in tumor %>% filter(!is.na(weight)) %>% group_by(sex, species_id) %>% : could not find function "%>%"
```

Here, again, the output from these calls doesn't run off the screen
anymore. If you want to display more data, you can use the `print()` function
at the end of your chain with the argument `n` specifying the number of rows to
display:


```r
tumor %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight)) %>%
  print(n = 15)
```

```
## Error in tumor %>% filter(!is.na(weight)) %>% group_by(sex, species_id) %>% : could not find function "%>%"
```

Once the data are grouped, you can also summarize multiple variables at the same
time (and not necessarily on the same variable). For instance, we could add a
column indicating the minimum weight for each species for each sex:


```r
tumor %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight),
            min_weight = min(weight))
```

```
## Error in tumor %>% filter(!is.na(weight)) %>% group_by(sex, species_id) %>% : could not find function "%>%"
```

It is sometimes useful to rearrange the result of a query to inspect the values. For instance, we can sort on `min_weight` to put the lighter species first:



```r
tumor %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight),
            min_weight = min(weight)) %>%
  arrange(min_weight)
```

```
## Error in tumor %>% filter(!is.na(weight)) %>% group_by(sex, species_id) %>% : could not find function "%>%"
```

To sort in descending order, we need to add the `desc()` function. If we want to sort the results by decreasing order of mean weight:


```r
tumor %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight),
            min_weight = min(weight)) %>%
  arrange(desc(mean_weight))
```

```
## Error in tumor %>% filter(!is.na(weight)) %>% group_by(sex, species_id) %>% : could not find function "%>%"
```


#### Counting

When working with data, we often want to know the number of observations found
for each factor or combination of factors. For this task, **`dplyr`** provides
`count()`. For example, if we wanted to count the number of rows of data for
each sex, we would do:


```r
tumor %>%
    count(sex) 
```

```
## Error in tumor %>% count(sex): could not find function "%>%"
```

The `count()` function is shorthand for something we've already seen: grouping by a variable, and summarizing it by counting the number of observations in that group. In other words, `surveys %>% count()` is equivalent to:  


```r
tumor %>%
    group_by(sex) %>%
    summarise(count = n())
```

```
## Error in tumor %>% group_by(sex) %>% summarise(count = n()): could not find function "%>%"
```

For convenience, `count()` provides the `sort` argument:  


```r
tumor %>%
    count(sex, sort = TRUE) 
```

```
## Error in tumor %>% count(sex, sort = TRUE): could not find function "%>%"
```

Previous example shows the use of `count()` to count the number of rows/observations 
for *one* factor (i.e., `sex`). 
If we wanted to count *combination of factors*, such as `sex` and `species`, 
we would specify the first and the second factor as the arguments of `count()`:


```r
tumor %>%
  count(sex, species) 
```

```
## Error in tumor %>% count(sex, species): could not find function "%>%"
```

With the above code, we can proceed with `arrange()` to sort the table 
according to a number of criteria so that we have a better comparison. 
For instance, we might want to arrange the table above in (i) an alphabetical order of 
the levels of the species and (ii) in descending order of the count:


```r
tumor %>%
  count(sex, species) %>%
  arrange(species, desc(n))
```

```
## Error in tumor %>% count(sex, species) %>% arrange(species, desc(n)): could not find function "%>%"
```

From the table above, we may learn that, for instance, there are 75 observations of 
the *albigula* species that are not specified for its sex (i.e. `NA`).

> ### Challenge {.challenge}
>
> 1. How many animals were caught in each `plot_type` surveyed?
>
> 
> ```r
> tumor %>%
>     count(plot_type) 
> ```
> 
> ```
> ## Error in tumor %>% count(plot_type): could not find function "%>%"
> ```
>
> 2. Use `group_by()` and `summarize()` to find the mean, min, and max hindfoot
> length for each species (using `species_id`). Also add the number of
> observations (hint: see `?n`).
>
> 
> ```r
> tumor %>%
>     filter(!is.na(hindfoot_length)) %>%
>     group_by(species_id) %>%
>     summarize(
>         mean_hindfoot_length = mean(hindfoot_length),
>         min_hindfoot_length = min(hindfoot_length),
>         max_hindfoot_length = max(hindfoot_length),
>         n = n()
>     )
> ```
> 
> ```
> ## Error in tumor %>% filter(!is.na(hindfoot_length)) %>% group_by(species_id) %>% : could not find function "%>%"
> ```
>
> 3. What was the heaviest animal measured in each year? Return the columns `year`,
> `genus`, `species_id`, and `weight`.
>
> 
> ```r
> tumor %>%
>     filter(!is.na(weight)) %>%
>     group_by(year) %>%
>     filter(weight == max(weight)) %>%
>     select(year, genus, species, weight) %>%
>     arrange(year)
> ```
> 
> ```
> ## Error in tumor %>% filter(!is.na(weight)) %>% group_by(year) %>% filter(weight == : could not find function "%>%"
> ```

