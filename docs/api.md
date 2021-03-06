# API

**Note:** This document is generated from code and comments. Do not edit it directly.
## Table of Contents
* [ConfigMapSecret](#configmapsecret)
* [ConfigMapSecretCondition](#configmapsecretcondition)
* [ConfigMapSecretList](#configmapsecretlist)
* [ConfigMapSecretSpec](#configmapsecretspec)
* [ConfigMapSecretStatus](#configmapsecretstatus)
* [ConfigMapTemplate](#configmaptemplate)
* [TemplateVariable](#templatevariable)

## ConfigMapSecret

ConfigMapSecret holds configuration data with embedded secrets.

| Field | Description | Type | Required |
| ----- | ----------- | ---- | -------- |
| metadata | Standard object metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata | [metav1.ObjectMeta](https://godoc.org/k8s.io/apimachinery/pkg/apis/meta/v1#ObjectMeta) | false |
| spec | Desired state of the ConfigMapSecret. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status | [ConfigMapSecretSpec](#configmapsecretspec) | false |
| status | Observed state of the ConfigMapSecret. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status | [ConfigMapSecretStatus](#configmapsecretstatus) | false |

[Back to TOC](#table-of-contents)

## ConfigMapSecretCondition

ConfigMapSecretCondition describes the state of a ConfigMapSecret.

| Field | Description | Type | Required |
| ----- | ----------- | ---- | -------- |
| type | Type of the condition. | ConfigMapSecretConditionType | true |
| status | Status of the condition: True, False, or Unknown. | [corev1.ConditionStatus](https://godoc.org/k8s.io/api/core/v1#ConditionStatus) | true |
| lastUpdateTime | The last time the condition was updated. | [metav1.Time](https://godoc.org/k8s.io/apimachinery/pkg/apis/meta/v1#Time) | false |
| lastTransitionTime | Last time the condition transitioned from one status to another. | [metav1.Time](https://godoc.org/k8s.io/apimachinery/pkg/apis/meta/v1#Time) | false |
| reason | The reason for the last update. | string | false |
| message | A human readable message indicating details about the last update. | string | false |

[Back to TOC](#table-of-contents)

## ConfigMapSecretList

ConfigMapSecretList contains a list of ConfigMapSecrets.

| Field | Description | Type | Required |
| ----- | ----------- | ---- | -------- |
| metadata | Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#lists-and-simple-kinds | [metav1.ListMeta](https://godoc.org/k8s.io/apimachinery/pkg/apis/meta/v1#ListMeta) | false |
| items | List of ConfigMapSecrets. | [][ConfigMapSecret](#configmapsecret) | true |

[Back to TOC](#table-of-contents)

## ConfigMapSecretSpec

ConfigMapSecretSpec defines the desired state of a ConfigMapSecret.

| Field | Description | Type | Required |
| ----- | ----------- | ---- | -------- |
| template | Template that describes the config that will be rendered. Variable references $(VAR_NAME) in template data are expanded using the ConfigMapSecret's variables. If a variable cannot be resolved, the reference in the input data will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. | [ConfigMapTemplate](#configmaptemplate) | false |
| vars | List of template variables. | [][TemplateVariable](#templatevariable) | false |

[Back to TOC](#table-of-contents)

## ConfigMapSecretStatus

ConfigMapSecretStatus describes the observed state of a ConfigMapSecret.

| Field | Description | Type | Required |
| ----- | ----------- | ---- | -------- |
| observedGeneration | The generation observed by the ConfigMapSecret controller. | int64 | false |
| conditions | Represents the latest available observations of a ConfigMapSecret's current state. | [][ConfigMapSecretCondition](#configmapsecretcondition) | false |

[Back to TOC](#table-of-contents)

## ConfigMapTemplate

ConfigMapTemplate is a ConfigMap template.

| Field | Description | Type | Required |
| ----- | ----------- | ---- | -------- |
| metadata | Standard object metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata | [metav1.ObjectMeta](https://godoc.org/k8s.io/apimachinery/pkg/apis/meta/v1#ObjectMeta) | false |
| data | Data contains the configuration data. Each key must consist of alphanumeric characters, '-', '_' or '.'. Values with non-UTF-8 byte sequences must use the BinaryData field. The keys stored in Data must not overlap with the keys in the BinaryData field. | map[string]string | false |
| binaryData | BinaryData contains the binary data. Each key must consist of alphanumeric characters, '-', '_' or '.'. BinaryData can contain byte sequences that are not in the UTF-8 range. The keys stored in BinaryData must not overlap with the keys in the Data field. | map[string][]byte | false |

[Back to TOC](#table-of-contents)

## TemplateVariable

TemplateVariable is a template variable.

| Field | Description | Type | Required |
| ----- | ----------- | ---- | -------- |
| name | Name of the template variable. | string | true |
| value | Variable references $(VAR_NAME) are expanded using the previous defined environment variables in the ConfigMapSecret. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. Defaults to \"\". | string | false |
| secretValue | SecretValue selects a value by its key in a Secret. | *[corev1.SecretKeySelector](https://godoc.org/k8s.io/api/core/v1#SecretKeySelector) | false |
| configMapValue | ConfigMapValue selects a value by its key in a ConfigMap. | *[corev1.ConfigMapKeySelector](https://godoc.org/k8s.io/api/core/v1#ConfigMapKeySelector) | false |

[Back to TOC](#table-of-contents)
