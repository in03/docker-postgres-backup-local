group "default" {
	targets = ["debian-latest", "alpine-latest", "debian-13", "debian-12", "debian-11", "debian-10", "alpine-13", "alpine-12", "alpine-11", "alpine-10"]
}

variable "BUILDREV" {
	default = ""
}

target "common" {
	platforms = ["linux/arm/v7"]
	args = {"GOCRONVER" = "v0.0.10"}
}

target "debian" {
	inherits = ["common"]
	dockerfile = "debian.Dockerfile"
}

target "alpine" {
	inherits = ["common"]
	dockerfile = "alpine.Dockerfile"
}

target "debian-latest" {
	inherits = ["debian"]
	args = {"BASETAG" = "14"}
	tags = [
		"prodrigestivill/postgres-backup-local:latest",
		"prodrigestivill/postgres-backup-local:14",
		notequal("", BUILDREV) ? "prodrigestivill/postgres-backup-local:14-debian-${BUILDREV}" : ""
	]
}

target "alpine-latest" {
	inherits = ["alpine"]
	args = {"BASETAG" = "14-alpine"}
	tags = [
		"prodrigestivill/postgres-backup-local:alpine",
		"prodrigestivill/postgres-backup-local:14-alpine",
		notequal("", BUILDREV) ? "prodrigestivill/postgres-backup-local:14-alpine-${BUILDREV}" : ""
	]
}

target "debian-13" {
	inherits = ["debian"]
	args = {"BASETAG" = "13"}
	tags = [
		"prodrigestivill/postgres-backup-local:13",
		notequal("", BUILDREV) ? "prodrigestivill/postgres-backup-local:13-debian-${BUILDREV}" : ""
	]
}

target "alpine-13" {
	inherits = ["alpine"]
	args = {"BASETAG" = "13-alpine"}
	tags = [
		"prodrigestivill/postgres-backup-local:13-alpine",
		notequal("", BUILDREV) ? "prodrigestivill/postgres-backup-local:13-alpine-${BUILDREV}" : ""
	]
}

target "debian-12" {
	inherits = ["debian"]
	args = {"BASETAG" = "12"}
	tags = [
		"prodrigestivill/postgres-backup-local:12",
		notequal("", BUILDREV) ? "prodrigestivill/postgres-backup-local:12-debian-${BUILDREV}" : ""
	]
}

target "alpine-12" {
	inherits = ["alpine"]
	args = {"BASETAG" = "12-alpine"}
	tags = [
		"prodrigestivill/postgres-backup-local:12-alpine",
		notequal("", BUILDREV) ? "prodrigestivill/postgres-backup-local:12-alpine-${BUILDREV}" : ""
	]
}

target "debian-11" {
	inherits = ["debian"]
	args = {"BASETAG" = "11"}
	tags = [
		"prodrigestivill/postgres-backup-local:11",
		notequal("", BUILDREV) ? "prodrigestivill/postgres-backup-local:11-debian-${BUILDREV}" : ""
	]
}

target "alpine-11" {
	inherits = ["alpine"]
	args = {"BASETAG" = "11-alpine"}
	tags = [
		"prodrigestivill/postgres-backup-local:11-alpine",
		notequal("", BUILDREV) ? "prodrigestivill/postgres-backup-local:11-alpine-${BUILDREV}" : ""
	]
}

target "debian-10" {
	inherits = ["debian"]
	args = {"BASETAG" = "10"}
	tags = [
		"prodrigestivill/postgres-backup-local:10",
		notequal("", BUILDREV) ? "prodrigestivill/postgres-backup-local:10-debian-${BUILDREV}" : ""
	]
}

target "alpine-10" {
	inherits = ["alpine"]
	args = {"BASETAG" = "10-alpine"}
	tags = [
		"prodrigestivill/postgres-backup-local:10-alpine",
		notequal("", BUILDREV) ? "prodrigestivill/postgres-backup-local:10-alpine-${BUILDREV}" : ""
	]
}
