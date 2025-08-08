<script setup>
import { computed } from 'vue'

const props = defineProps({
  class: String,
  cols: String, // '2cols', '1-1', '1-2', '2-1'
  theme: {
    type: String,
    default: 'light', // 'light', 'dark', 'gradient'
  }
})

const gridColsSize = computed(() => {
  if (!props.cols) return null
  switch (props.cols) {
    case '2cols':
    case '1-1':
      return 'grid-cols-2'
    case '1-2':
      return 'grid-cols-[1fr,2fr]'
    case '2-1':
      return 'grid-cols-[2fr,1fr]'
    default:
      return props.cols
  }
})

const themeClasses = computed(() => {
  switch (props.theme) {
    case 'dark':
      return 'theme-dark'
    case 'gradient':
      return 'theme-gradient'
    default:
      return 'theme-light'
  }
})
</script>

<template>
  <div
    class="slidev-layout default"
    :class="[
      gridColsSize ? 'grid gap-x-8 gap-y-4' : 'single-column',
      themeClasses,
      props.class
    ]"
  >
    <div class="content-area left-content">
      <slot />
    </div>
    <div v-if="gridColsSize" class="content-area right-content">
      <slot name="right" />
    </div>
  </div>
</template>

<style lang="postcss">
:root {
  --color-lavender-mist: #e1d9e9;
  --color-lilac-haze: #c3b2d3;
  --color-purple-sage: #a68cbd;
  --color-royal-purple: #714997;
  --color-deep-violet: #553274;
}

.slidev-layout {
  @apply w-full h-full p-6 box-border;
  max-width: 100vw;
  max-height: 100vh;
  overflow: hidden;
  
  &.theme-light {
    background: var(--color-lavender-mist);
    color: var(--color-deep-violet);
  }
  
  &.theme-dark {
    background: var(--color-deep-violet);
    color: var(--color-lavender-mist);
  }
  
  &.theme-gradient {
    background: linear-gradient(135deg, 
      var(--color-lavender-mist) 0%, 
      var(--color-lilac-haze) 25%, 
      var(--color-purple-sage) 50%, 
      var(--color-royal-purple) 75%, 
      var(--color-deep-violet) 100%);
    color: var(--color-lavender-mist);
  }
  
  /* Single column layout */
  &.single-column {
    @apply flex flex-col;
    
    .content-area {
      @apply flex-1;
    }
  }
  
  /* Two column specific adjustments */
  &.grid-cols-2 {
    .content-area {
      min-height: 0; /* Allow content to shrink */
    }
  }
}

.content-area {
  @apply p-6 rounded-lg overflow-y-auto;
  height: 100%;
  
  .theme-light & {
    background: rgba(195, 178, 211, 0.3);
    border: 2px solid var(--color-purple-sage);
    box-shadow: 0 4px 8px rgba(113, 73, 151, 0.1);
  }
  
  .theme-dark & {
    background: rgba(166, 140, 189, 0.2);
    border: 2px solid var(--color-purple-sage);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
  }
  
  .theme-gradient & {
    background: rgba(255, 255, 255, 0.15);
    border: 2px solid rgba(255, 255, 255, 0.4);
    backdrop-filter: blur(15px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  }
}

/* Enhanced styling for two-column layouts */
.grid-cols-2 {
  .left-content {
    .theme-light & {
      background: rgba(195, 178, 211, 0.4);
    }
    
    .theme-dark & {
      background: rgba(166, 140, 189, 0.25);
    }
    
    .theme-gradient & {
      background: rgba(255, 255, 255, 0.2);
    }
  }
  
  .right-content {
    .theme-light & {
      background: rgba(225, 217, 233, 0.4);
    }
    
    .theme-dark & {
      background: rgba(113, 73, 151, 0.25);
    }
    
    .theme-gradient & {
      background: rgba(255, 255, 255, 0.18);
    }
  }
}

.customTitleRow {
  @apply text-4xl font-bold mb-4 pb-4;
  border-bottom: 3px solid var(--color-purple-sage);
  
  .theme-light & {
    color: var(--color-royal-purple);
  }
  
  .theme-dark & {
    color: var(--color-lilac-haze);
    border-bottom-color: var(--color-lilac-haze);
  }
  
  .theme-gradient & {
    color: var(--color-lavender-mist);
    border-bottom-color: var(--color-lavender-mist);
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
  }
}

.slidev-layout h1:not(.customTitleRow) {
  @apply block mb-8 text-3xl font-bold;
  color: var(--color-royal-purple);
  
  .theme-dark & {
    color: var(--color-lilac-haze);
  }
  
  .theme-gradient & {
    color: var(--color-lavender-mist);
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
  }
}

.slidev-layout h2 {
  @apply text-2xl font-semibold mb-6;
  color: var(--color-purple-sage);
  
  .theme-dark & {
    color: var(--color-lavender-mist);
  }
  
  .theme-gradient & {
    color: var(--color-lavender-mist);
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
  }
}

.slidev-layout h3 {
  @apply text-xl font-medium mb-4;
  color: var(--color-royal-purple);
  
  .theme-dark & {
    color: var(--color-lilac-haze);
  }
  
  .theme-gradient & {
    color: var(--color-lavender-mist);
  }
}

.slidev-layout p {
  @apply mb-4 leading-relaxed;
  
  .theme-light & {
    color: var(--color-deep-violet);
  }
  
  .theme-dark & {
    color: var(--color-lavender-mist);
  }
  
  .theme-gradient & {
    color: var(--color-lavender-mist);
  }
}

.slidev-layout ul, 
.slidev-layout ol {
  @apply mb-4 pl-6;
  
  li {
    @apply mb-3 leading-relaxed;
    
    .theme-light & {
      color: var(--color-deep-violet);
    }
    
    .theme-dark & {
      color: var(--color-lavender-mist);
    }
    
    .theme-gradient & {
      color: var(--color-lavender-mist);
    }
  }
}

/* Enhanced code block styling for two-column layout */
.slidev-layout code {
  @apply px-2 py-1 rounded text-sm;
  background: white !important;
  color: #333 !important;
  border: 1px solid #ddd;
  font-family: 'Fira Code', 'Monaco', 'Cascadia Code', 'Roboto Mono', monospace;
}

.slidev-layout pre {
  @apply mb-4 p-4 rounded-lg overflow-x-auto;
  background: white !important;
  border: 2px solid var(--color-purple-sage);
  box-shadow: 0 4px 8px rgba(113, 73, 151, 0.2);
  
  .theme-dark & {
    border-color: var(--color-lilac-haze);
  }
  
  .theme-gradient & {
    border-color: rgba(255, 255, 255, 0.6);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
  }
  
  code {
    @apply p-0;
    background: transparent !important;
    border: none;
    font-size: 0.875rem;
    line-height: 1.5;
  }
}

/* Responsive adjustments for smaller content areas in two-column layout */
.grid-cols-2 {
  .slidev-layout pre {
    font-size: 0.85rem;
    
    code {
      font-size: 0.8rem;
    }
  }
  
  .slidev-layout h1 {
    @apply text-2xl mb-6;
  }
  
  .slidev-layout h2 {
    @apply text-xl mb-4;
  }
}

/* Mermaid diagram styling for better visibility */
.slidev-layout .mermaid {
  @apply mb-4 p-4 rounded-lg;
  background: white !important;
  border: 2px solid var(--color-purple-sage);
  box-shadow: 0 4px 8px rgba(113, 73, 151, 0.2);
  
  .theme-dark & {
    border-color: var(--color-lilac-haze);
  }
  
  .theme-gradient & {
    border-color: rgba(255, 255, 255, 0.6);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
  }
}

.slidev-layout .mermaid svg {
  background: white !important;
}

/* Override Mermaid theme colors for better contrast */
.slidev-layout .mermaid .node rect,
.slidev-layout .mermaid .node circle,
.slidev-layout .mermaid .node ellipse,
.slidev-layout .mermaid .node polygon {
  fill: #f8f9fa !important;
  stroke: var(--color-royal-purple) !important;
  stroke-width: 2px !important;
}

.slidev-layout .mermaid .edgePath path {
  stroke: var(--color-royal-purple) !important;
  stroke-width: 2px !important;
}

.slidev-layout .mermaid .arrowheadPath {
  fill: var(--color-royal-purple) !important;
  stroke: var(--color-royal-purple) !important;
}

.slidev-layout .mermaid .edgeLabel {
  background-color: white !important;
  color: var(--color-deep-violet) !important;
}

.slidev-layout .mermaid .node text {
  fill: var(--color-deep-violet) !important;
  font-weight: 500 !important;
}

.slidev-layout .mermaid .messageText,
.slidev-layout .mermaid .labelText,
.slidev-layout .mermaid .loopText,
.slidev-layout .mermaid .noteText {
  fill: var(--color-deep-violet) !important;
}

/* Enhanced syntax highlighting with your color palette */
.slidev-layout pre code {
  .token.comment,
  .token.prolog,
  .token.doctype,
  .token.cdata {
    color: var(--color-purple-sage) !important;
  }
  
  .token.punctuation {
    color: var(--color-deep-violet) !important;
  }
  
  .token.property,
  .token.tag,
  .token.constant,
  .token.symbol,
  .token.deleted {
    color: var(--color-royal-purple) !important;
  }
  
  .token.boolean,
  .token.number {
    color: var(--color-deep-violet) !important;
  }
  
  .token.selector,
  .token.attr-name,
  .token.string,
  .token.char,
  .token.builtin,
  .token.inserted {
    color: var(--color-royal-purple) !important;
  }
  
  .token.operator,
  .token.entity,
  .token.url {
    color: var(--color-purple-sage) !important;
  }
  
  .token.atrule,
  .token.attr-value,
  .token.keyword {
    color: var(--color-royal-purple) !important;
    font-weight: 600;
  }
  
  .token.function,
  .token.class-name {
    color: var(--color-deep-violet) !important;
    font-weight: 600;
  }
  
  .token.regex,
  .token.important,
  .token.variable {
    color: var(--color-purple-sage) !important;
  }
}

.slidev-layout blockquote {
  @apply border-l-4 pl-4 py-2 mb-4 italic;
  border-color: var(--color-purple-sage);
  background: rgba(166, 140, 189, 0.1);
  
  .theme-dark & {
    border-color: var(--color-lilac-haze);
    background: rgba(195, 178, 211, 0.1);
  }
  
  .theme-gradient & {
    border-color: var(--color-lavender-mist);
    background: rgba(255, 255, 255, 0.1);
  }
}

/* Animation for theme transitions */
.slidev-layout {
  transition: background 0.3s ease, color 0.3s ease;
}

.customTitleRow,
.content-area {
  transition: all 0.3s ease;
}

/* Special styling for v-clicks in two-column layouts */
.grid-cols-2 .v-click-hidden {
  opacity: 0.3;
  transition: opacity 0.3s ease;
}

.grid-cols-2 .v-click-shown {
  opacity: 1;
  transition: opacity 0.3s ease;
}
</style>