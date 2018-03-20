{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "redash.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "redash.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified redis and postgresql url.
*/}}
{{- define "redash.redisUrl" -}}
{{- printf "redis://%s-redis:6379/0" .Release.Name -}}
{{- end -}}

{{- define "redash.postgresqlUrl" -}}
{{- printf "postgresql://%s@%s/%s-postgresql"  .Values.postgresUser .Values.postgresPassword .Release.Name -}}
{{- end -}}
