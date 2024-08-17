default:
    @just --list --unsorted

create libName:
    mkdir -p jte/libraries/{{libName}}/{src,resources,steps}
