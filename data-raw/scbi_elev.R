# On Thu, Feb 28, 2019 ... GonzalezEB@si.edu> wrote:
# > I believe this is what you need (I guess the data was never sent to
# ctfs-suzzane).

# > A brief explanation of what they did in 2008 when taking topo data (when the
# plot was installed) is in Bourg paper. I will put this info on Github.

# > A numbered metal tag was attached with steel wire to each rebar. The quadrat
# numbering system began with 01,01 in the southwest corner (origin) of the plot
# and continued at 20m intervals along the x-axis (east-west direction) to 400 m
# (rebar 21,01). Numbering along the y-axis (north-south direction) was
# continued similarly to 640 m (rebar 01,33).

# * Dropping column `rebar_id` as it's now typical in ForestGEO-elevation data.
# * Using name "elevation" instead of "elev" for consistency with similar
#   datasets in other packages (e.g. fgeo.x::elevation and
#   fgeo.data::luquillo_elevation).
scbi_elevation <- here::here("data-raw/scbi_elev.csv") %>%
  readr::read_csv() %>%
  fgeo.tool::fgeo_elevation() %>%
  .[c("gx", "gy", "elev")]

use_data(scbi_elevation, overwrite = TRUE)
