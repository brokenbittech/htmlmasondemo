#!/bin/sh

carton exec starman --listen :3001 --workers 2  --reload ./app.psgi