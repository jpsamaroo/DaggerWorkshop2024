# Productive Parallel Programming with Dagger.jl

JuliaCon 2024

July 9th, 09:00–12:00 (Europe/Amsterdam), TU-Eindhoven 1.350 

- *Julian P Samaroo* - JuliaLab @ Massachusetts Institute of Technology
- *Przemyslaw Szufel* - SGH Warsaw School of Economics

Traditional parallel programming can be very hard to do effectively, as there are many prerequisites to know, and many tools that need to be used correctly and combined for maximum performance. Because of this, many programmers never learn how to write code that can scale beyond a single thread or a single server; and when parallelism is added to code, it often only supports one or a limited number of systems and hardware devices, which excludes users with unsupported systems from using that code effectively.

[Dagger.jl](https://daggerjl.ai/) aims to help fix this problem for Julia code, by providing a full parallel programming environment that closely matches how users already write code. Instead of forcing users to learn a new programming paradigm or opinionated API, Dagger provides a variety of familiar interfaces - like tasks, arrays, tables, and graphs - so that users can pick the interface that matches their existing code and algorithms. And once any of those interfaces are used, Dagger seamlessly parallelizes the user's code and allows it to run automatically on multiple CPUs, multiple servers, on a variety of GPUs, and more, and even manages data by moving it to disk when available memory is tight.

This workshop is focused on users who feel comfortable with Julia, but struggle with adding parallelism to their code. This workshop will start out by introducing Dagger and explaining how it works at a high level. Then, we will dive into the various programming interfaces (tasks, arrays, tables, graphs, and more) that Dagger provides, show how they can be used just like their non-Dagger counterparts, and then work through an example program built with each programming paradigm. Along the way, we will also see how to user Dagger's logging and profiling capabilities to gain insights into what Dagger is doing behind the scenes, so that we can better observe where our parallelism is coming from.

