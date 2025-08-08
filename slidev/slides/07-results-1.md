---
layout: two-cols
spanTitle: true
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

# Scenarios

</template>

## **Current Threats**

<v-click>

### **Enterprise**
- Lorem ipsum
- Dolor sit amet

</v-click>

<v-click>

### **Finance**
- Consectetur adipiscing
- Elit sed do

</v-click>

::right::

## **Advanced**

<v-click>

### **Time-Bomb**
```markdown
If year > 2027, return lorem ipsum.
```

</v-click>

<v-click>

### **Worm**
- Dolor sit amet

</v-click>
