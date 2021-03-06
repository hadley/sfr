suppressPackageStartupMessages(library(sf))
# nc = st_read(system.file("gpkg/nc.gpkg", package="sf"))
nc = st_read(system.file("shape/nc.shp", package="sf"), quiet = TRUE)

x = st_transform(nc[1:10,], 32119)
st_distance(x)

st_is_valid(nc)

ops = c("intersects", "disjoint", "touches", "crosses", "within", "contains", "overlaps", "equals", 
"covers", "covered_by", "equals_exact")
for (op in ops) {
	x = sf:::st_geos_binop(op, nc[1:50,], nc[51:100,], 0, FALSE)
	x = sf:::st_geos_binop(op, nc[1:50,], nc[51:100,], 0, TRUE)
}

try(x <- sf:::st_geos_binop("ErrorOperation", nc[1:50,], nc[51:100,], 0, TRUE))

st_combine(nc)

st_dimension(st_sfc(st_point(0:1), st_linestring(rbind(c(0,0),c(1,1))), 
	st_polygon(list(rbind(c(0,0), c(1,0), c(1,1), c(0,1), c(0,0))))))

g = st_makegrid(nc)
x = st_intersection(nc, g)
x = st_intersection(g, nc)

ls = st_sfc(st_linestring(rbind(c(0,0),c(0,1))),
st_linestring(rbind(c(0,0),c(10,0))))

set.seed(13531) # make reproducible

st_line_sample(ls, density = 1, type = "random")

g = st_makegrid(nc, n = c(20,10))

a1 = st_interpolate_aw(nc["BIR74"], g, FALSE)
sum(a1$BIR74) / sum(nc$BIR74) # not close to one: property is assumed spatially intensive
a2 = st_interpolate_aw(nc["BIR74"], g, extensive = TRUE)
sum(a2$BIR74) / sum(nc$BIR74)

# missing x:
g = st_makegrid(offset = c(0,0), cellsize = c(1,1), n = c(10,10))

mls = st_multilinestring(list(rbind(c(0,0), c(1,1)), rbind(c(2,0), c(1,1))))
st_linemerge(mls)
