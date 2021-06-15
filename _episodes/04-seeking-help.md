---
title: "Seeking help"
teaching: 10
exercises: 0
questions:
- How do I get help with R and RStudio?
- Where can I learn more?
objectives:
- Know where to locate help and learning resources.
keypoints:
- "First key point. Brief Answer to questions. (FIXME)"
---

## Seeking help

### Searching function documentation with `?` and `??`

If you need help with a specific function, let's say `mean()`, you can type
`?mean` or press <kbd>F1</kbd> while your cursor is on the function name. If you
are looking for a function to do a particular task, but don't know the function
name, you can use the double question mark `??`, for example `??kruskall`. Both
commands will open matching help files in RStudio's help panel in the lower
right corner. You can also use the help panel to search help directly, as seen
in the screenshot.

![RStudio help panel. When typing a word in the search field, it will show
related suggestions.](../fig/rstudiohelp.png)

### Automatic code completion

When you write code in RStudio, you can use its automatic code completion to
remind yourself of a function's name or arguments. Start typing the function
name and pay attention to the suggestions that pop up. Use the up and down arrow
to select a suggested code completion and <kbd>Tab</kbd> to apply it. You can
also use code completion to complete function's argument names, object, names
and file names. It even works if you don't get the spelling 100% correct.

### Package vignettes and cheat sheets

In addition to the documentation for individual functions, many packages have
*vignettes* -- instructions for how to use the package to do certain tasks.
Vignettes are great for learning by example. Vignettes are accessible via the
package help and by using the function `browseVignettes()`.

There is also a Help menu at the top of the RStudio window, that has cheat
sheets for popular packages, RStudio keyboard shortcuts, and more.

### Finding more functions and packages

RStudio's help only searches the packages that you have installed on your
machine, but there are many more available on
[CRAN](https://cran.r-project.org/) and [GitHub](https://github.com/). To search
across all available R packages, you can use the website
[rdocumentation.org](https://www.rdocumentation.org). Often, a generic Google or
internet search "R \<task\>" will send you to the appropriate package
documentation or a forum where someone else has already asked your question.
Many packages also have websites with additional help, tutorials, news and more
(for example [tidyverse.org](https://www.tidyverse.org/)).

### Dealing with error messages

Don't get discouraged if your code doesn't run immediately! Error messages are
common when programming, and fixing errors is part of any programmers daily
work. Often, the problem is a small typo in a variable name or a missing
parenthesis. Watch for the red x's next to your code in Rstudio. These may
provide helpful hints about the source of the problem.

![RStudio shows a red x next to a line of code that R doesn't understand.
](../fig/rstudioredx.png)

If you can't fix an error yourself, start by googling it. Some error messages
are too generic to diagnose a problem (e.g. "subscript out of bounds"). In that
case it might help to include the name of the function or package you're using
in your query.

### Asking for help

If your Google search is unsuccessful, you may want to ask other R users for
help. There are different places where you can ask for help. During this
workshop, don't hesitate to talk to your neighbor, compare your answers, and ask
for help. You might also be interested in organizing regular meetings following
the workshop to keep learning from each other. If you have a friend or colleague
with more experience than you, they might also be able and willing to help you.

Besides that, there are a few places on the internet that provide help:

-   [Stack Overflow](https://stackoverflow.com/questions/tagged/r?tab=Votes):
    Many questions have already been answered, but the challenge is to use the
    right words in your search to find them. If your question hasn't been
    answered before and is well crafted, chances are you will get an answer in
    less than 5 min. Remember to follow their guidelines on [how to ask a good
    question](https://stackoverflow.com/help/how-to-ask).
-   The [R-help mailing list](https://stat.ethz.ch/mailman/listinfo/r-help): it
    is used by a lot of people (including most of the R core team). If your
    question is valid (read its [Posting
    Guide](https://www.r-project.org/posting-guide.html)), you are likely to get
    an answer very fast, but the tone can be pretty dry and it is not always
    very welcoming to new users.
-   If your question is about a specific package rather than a base R function,
    see if there is a mailing list for the package. Usually it's included in the
    DESCRIPTION file of the package that can be accessed using
    `packageDescription("<package-name>")`.
-   You can also try to contact the package author directly, by emailing them or
    opening an issue on the code repository (e.g., on GitHub).
-   There are also some topic-specific mailing lists (GIS, phylogenetics,
    etc...), the complete list is [on the R mailing lists website](https://www.r-project.org/mail.html).

The key to receiving help from someone is for them to rapidly grasp your
problem. Thus, you should be as precise as possible when describing your problem
and make it easy to pinpoint where the issue might be. Try to...

-   Use the correct words to describe your problem. Otherwise you might get an
    answer pointing to the misuse of your words rather than answering your
    question.

-   Generalize what you are trying to do, so people outside your field can
    understand the question.

-   Reduce what doesn't work to a simple *reproducible example*. For instance,
    instead of using your real data set, create a small generic one. For more
    information on how to write a reproducible example see [this article by
    Hadley Wickham](http://adv-r.had.co.nz/Reproducibility.html). The
    [reprex](https://cran.r-project.org/package=reprex) package is also very
    helpful for this.

-   Include the output of `sessionInfo()` in your question. It provides
    information about your platform, the versions of R and the packages that you
    are using. As an example, here you can see the versions of R and all the
    packages that we are using to run the code in this lesson:

`# temporarily load the tidyverse package so that the version shows in sessionInfo()`  
`library(tidyverse)`  
`sessionInfo()`  
`detach(package:tidyverse, unload=TRUE)`  

## How to learn more after the workshop?

The material we cover during this workshop will give you a taste of how you can
use R to analyze data for your own research. However, to do advanced operations
such as cleaning your dataset, using statistical methods, or creating beautiful
graphics you will need to learn more.

The best way to become proficient and efficient at R, as with any other tool, is
to use it to address your actual research questions. As a beginner, it can feel
daunting to have to write a script from scratch, and given that many people make
their code available online, modifying existing code to suit your purpose might
make it easier for you to get started.

![Fake O'Reilly book entitled Changing Stuff and Seeing What Happens, with a kitten on the cover.](../fig/kitten-try-things.jpg)

## More resources

#### More about R

-   The [Introduction to R](https://cran.r-project.org/doc/manuals/R-intro.pdf)
    can also be dense for people with little programming experience but it is a
    good place to understand the underpinnings of the R language.
-   The [R FAQ](https://cran.r-project.org/doc/FAQ/R-FAQ.html) is dense and
    technical but it is full of useful information.
-   To stay up to date, follow `#rstats` on twitter. Twitter can also be a way
    to get questions answered and learn about useful R packages and tipps (e.g.,
    [@RLangTips])

#### How to ask good programming questions?

-   The rOpenSci community call "How to ask questions so they get answered",
    ([rOpenSci site](https://ropensci.org/commcalls/2017-03-07/) and [video
    recording](https://vimeo.com/208749032)) includes a presentation of the
    reprex package and of its philosophy.
-   [blog.Revolutionanalytics.com](https://blog.revolutionanalytics.com/2014/01/how-to-ask-for-r-help.html)
    and
    [codeblog.jonskeet.uk](https://codeblog.jonskeet.uk/2010/08/29/writing-the-perfect-question/)
    provide advice on how to ask programming questions.
-   [This blog post by Jon
    Skeet](http://codeblog.jonskeet.uk/2010/08/29/writing-the-perfect-question/)
    has comprehensive advice on how to ask programming questions.
