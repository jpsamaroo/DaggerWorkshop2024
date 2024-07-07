# Workshop Utilities

workshop_colors = colorschemes[:tab10]

function workshop_plots(f; dag=true, gantt=true)
    Dagger.enable_logging!(;
        metrics=false,
        tasknames=true,
        taskdeps=true,
        taskargs=true,
        taskargmoves=true)

    result = nothing
    try
        result = Dagger.wait_all(f)
    catch err
        @error "Failed with error" exception=(err,catch_backtrace())
    end
    logs = Dagger.fetch_logs!()

    # FIXME: Render these side-by-side
    if dag
        println("Task DAG:")
        display(Dagger.render_logs(logs, :graphviz; colors=map(color->'#'*hex(color, :RRGGBB), workshop_colors), disconnected=true))
    end
    if gantt
        println("Execution Gantt chart:")
        display(Dagger.render_logs(logs, :plots_gantt; colors=workshop_colors))
    end

    return result
end