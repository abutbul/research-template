---
layout: two-cols
spanTitle: true
transition: fade-out
---

<style>
.two-cols-custom ul li {
  @apply mb-1 !important;
}

.two-cols-custom .v-clicks ul li {
  @apply mb-1 !important;
}

.two-cols-custom pre {
  @apply mb-2 p-2 !important;
  font-size: 0.75rem !important;
}

.two-cols-custom h1 {
  @apply text-xl mb-4 !important;
}

.two-cols-custom h2 {
  @apply text-lg mb-2 !important;
}

.two-cols-custom p {
  @apply mb-2 !important;
}
</style>

<template v-slot:title>

# Attack Vector

</template>

## **Mechanics**

<v-click>

```python
# Lorem ipsum
vector = encode("Dolor sit")
db.add(vector)
```

</v-click>

::right::

## **Trigger**

<v-click>

```python
# Dolor sit amet
response = generate("Lorem ipsum")
```

</v-click>

