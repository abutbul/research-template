<script setup>
import { computed } from 'vue'

const props = defineProps({
  class: String,
  compact: {
    type: Boolean,
    default: false,
  },
  spanTitle: {
    type: Boolean,
    default: false,
  },
  theme: {
    type: String,
    default: 'light', // 'light', 'dark', 'gradient'
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

const compactClasses = computed(() => {
  return props.compact ? 'compact-spacing' : ''
})

const spanTitleClasses = computed(() => {
  return props.spanTitle ? 'span-title' : ''
})
</script>

<template>
  <div
    class="slidev-layout four-tiles-custom"
    :class="[
      themeClasses,
      compactClasses,
      spanTitleClasses,
      props.class
    ]"
  >
    <div v-if="spanTitle" class="title-area">
      <slot name="title" />
    </div>
    <div class="grid grid-cols-2 grid-rows-2 gap-4" :class="spanTitle ? 'content-grid' : 'h-full'">
      <div class="content-area top-left">
        <slot />
      </div>
      <div class="content-area top-right">
        <slot name="top-right" />
      </div>
      <div class="content-area bottom-left">
        <slot name="bottom-left" />
      </div>
      <div class="content-area bottom-right">
        <slot name="bottom-right" />
      </div>
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

.four-tiles-custom {
  @apply w-full h-full box-border;
  max-width: 100vw;
  max-height: 100vh;
  overflow: hidden;
  padding: 1.5rem 1.5rem 1rem 1.5rem; /* Reduced bottom padding */
  
  &.theme-light {
    background: var(--color-lavender-mist) !important;
    color: var(--color-deep-violet);
  }
  
  &.theme-dark {
    background: var(--color-deep-violet) !important;
    color: var(--color-lavender-mist);
  }
  
  &.theme-gradient {
    background: linear-gradient(135deg, 
      var(--color-lavender-mist) 0%, 
      var(--color-lilac-haze) 25%, 
      var(--color-purple-sage) 50%, 
      var(--color-royal-purple) 75%, 
      var(--color-deep-violet) 100%) !important;
    color: var(--color-lavender-mist);
  }
}

.four-tiles-custom .content-area {
  @apply p-4 rounded-lg overflow-y-auto;
  height: 100%;
  min-height: 0;
  
  .theme-light & {
    background: rgba(195, 178, 211, 0.4) !important;
    border: 2px solid var(--color-purple-sage);
    box-shadow: 0 4px 8px rgba(113, 73, 151, 0.1);
  }
  
  .theme-dark & {
    background: rgba(166, 140, 189, 0.25) !important;
    border: 2px solid var(--color-purple-sage);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
  }
  
  .theme-gradient & {
    background: rgba(255, 255, 255, 0.2) !important;
    border: 2px solid rgba(255, 255, 255, 0.4);
    backdrop-filter: blur(15px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  }
}

.four-tiles-custom .top-left {
  .theme-light & {
    background: rgba(195, 178, 211, 0.4) !important;
  }
  
  .theme-dark & {
    background: rgba(166, 140, 189, 0.25) !important;
  }
  
  .theme-gradient & {
    background: rgba(255, 255, 255, 0.2) !important;
  }
}

.four-tiles-custom .top-right {
  .theme-light & {
    background: rgba(225, 217, 233, 0.4) !important;
  }
  
  .theme-dark & {
    background: rgba(113, 73, 151, 0.25) !important;
  }
  
  .theme-gradient & {
    background: rgba(255, 255, 255, 0.18) !important;
  }
}

.four-tiles-custom .bottom-left {
  .theme-light & {
    background: rgba(166, 140, 189, 0.3) !important;
  }
  
  .theme-dark & {
    background: rgba(195, 178, 211, 0.15) !important;
  }
  
  .theme-gradient & {
    background: rgba(255, 255, 255, 0.15) !important;
  }
}

.four-tiles-custom .bottom-right {
  .theme-light & {
    background: rgba(113, 73, 151, 0.2) !important;
  }
  
  .theme-dark & {
    background: rgba(225, 217, 233, 0.2) !important;
  }
  
  .theme-gradient & {
    background: rgba(255, 255, 255, 0.12) !important;
  }
}

.four-tiles-custom h1 {
  @apply text-lg font-bold mb-3;
  color: var(--color-royal-purple);
  
  .theme-dark & {
    color: var(--color-lilac-haze);
  }
  
  .theme-gradient & {
    color: var(--color-lavender-mist);
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
  }
}

.four-tiles-custom h2 {
  @apply text-base font-semibold mb-3;
  color: var(--color-purple-sage);
  
  .theme-dark & {
    color: var(--color-lavender-mist);
  }
  
  .theme-gradient & {
    color: var(--color-lavender-mist);
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
  }
}

.four-tiles-custom h3 {
  @apply text-sm font-medium mb-2;
  color: var(--color-royal-purple);
  
  .theme-dark & {
    color: var(--color-lilac-haze);
  }
  
  .theme-gradient & {
    color: var(--color-lavender-mist);
  }
}

.four-tiles-custom p {
  @apply mb-2 text-sm leading-relaxed;
  
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

.four-tiles-custom ul, 
.four-tiles-custom ol {
  @apply mb-2 pl-4;
  
  li {
    @apply mb-1 text-sm leading-relaxed;
    
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

.four-tiles-custom code {
  @apply px-1 py-0.5 rounded text-xs;
  background: white !important;
  color: #333 !important;
  border: 1px solid #ddd;
  font-family: 'Fira Code', 'Monaco', 'Cascadia Code', 'Roboto Mono', monospace;
}

.four-tiles-custom pre {
  @apply mb-2 p-2 rounded text-xs overflow-x-auto;
  background: white !important;
  border: 1px solid var(--color-purple-sage);
  box-shadow: 0 2px 4px rgba(113, 73, 151, 0.2);
  
  .theme-dark & {
    border-color: var(--color-lilac-haze);
  }
  
  .theme-gradient & {
    border-color: rgba(255, 255, 255, 0.6);
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
  }
  
  code {
    @apply p-0;
    background: transparent !important;
    border: none;
    font-size: 0.7rem;
    line-height: 1.3;
  }
}

/* Override any potential Slidev defaults */
.four-tiles-custom .slidev-layout {
  background: inherit !important;
}

/* Special styling for v-clicks */
.four-tiles-custom .v-click-hidden {
  opacity: 0.3;
  transition: opacity 0.3s ease;
}

.four-tiles-custom .v-click-shown {
  opacity: 1;
  transition: opacity 0.3s ease;
}

/* Compact spacing variant */
.four-tiles-custom.compact-spacing h1 {
  @apply text-base mb-1 !important;
}

.four-tiles-custom.compact-spacing h2 {
  @apply text-sm mb-1 !important;
}

.four-tiles-custom.compact-spacing p {
  @apply mb-1 text-xs !important;
}

.four-tiles-custom.compact-spacing strong {
  @apply text-xs !important;
}

.four-tiles-custom.compact-spacing blockquote {
  @apply my-1 px-2 py-1 text-xs !important;
  border-left: 2px solid #10b981;
  background: #f0fdf4;
}

.four-tiles-custom.compact-spacing blockquote p {
  @apply mb-0 !important;
}

.four-tiles-custom.compact-spacing .v-clicks > * {
  @apply mb-1 !important;
}

/* Span Title Feature */
.four-tiles-custom.span-title {
  @apply flex flex-col;
  padding: 1rem 1.5rem 0.75rem 1.5rem; /* Further reduced bottom padding when title is present */
}

.four-tiles-custom.span-title .title-area {
  @apply mb-2 px-2; /* Reduced margin and padding */
  flex-shrink: 0; /* Prevent title from shrinking */
  
  h1 {
    @apply text-xl font-bold text-center mb-1; /* Reduced text size and margin */
    color: var(--color-royal-purple);
    
    .theme-dark & {
      color: var(--color-lilac-haze);
    }
    
    .theme-gradient & {
      color: var(--color-lavender-mist);
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    }
  }
}

.four-tiles-custom.span-title .content-grid {
  @apply flex-1;
  min-height: 0; /* Allow grid to shrink */
}

.four-tiles-custom.span-title .content-area {
  @apply p-3; /* Reduced padding */
}
</style>