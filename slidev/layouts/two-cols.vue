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
    class="slidev-layout two-cols-custom"
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
    <div class="grid grid-cols-2 gap-x-8 gap-y-4" :class="spanTitle ? 'content-grid' : 'h-full'">
      <div class="content-area left-content">
        <slot />
      </div>
      <div class="content-area right-content">
        <slot name="right" />
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

.two-cols-custom {
  @apply w-full h-full p-6 box-border;
  max-width: 100vw;
  max-height: 100vh;
  overflow: hidden;
  
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

.two-cols-custom .content-area {
  @apply p-6 rounded-lg overflow-y-auto;
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

.two-cols-custom .left-content {
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

.two-cols-custom .right-content {
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

.two-cols-custom h1 {
  @apply text-2xl font-bold mb-6;
  color: var(--color-royal-purple);
  
  .theme-dark & {
    color: var(--color-lilac-haze);
  }
  
  .theme-gradient & {
    color: var(--color-lavender-mist);
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
  }
}

.two-cols-custom h2 {
  @apply text-xl font-semibold mb-4;
  color: var(--color-purple-sage);
  
  .theme-dark & {
    color: var(--color-lavender-mist);
  }
  
  .theme-gradient & {
    color: var(--color-lavender-mist);
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
  }
}

.two-cols-custom h3 {
  @apply text-lg font-medium mb-3;
  color: var(--color-royal-purple);
  
  .theme-dark & {
    color: var(--color-lilac-haze);
  }
  
  .theme-gradient & {
    color: var(--color-lavender-mist);
  }
}

.two-cols-custom p {
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

.two-cols-custom ul, 
.two-cols-custom ol {
  @apply mb-3 pl-6;
  
  li {
    @apply mb-2 leading-relaxed;
    
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

.two-cols-custom code {
  @apply px-2 py-1 rounded text-sm;
  background: white !important;
  color: #333 !important;
  border: 1px solid #ddd;
  font-family: 'Fira Code', 'Monaco', 'Cascadia Code', 'Roboto Mono', monospace;
}

.two-cols-custom pre {
  @apply mb-3 p-3 rounded-lg overflow-x-auto;
  background: white !important;
  border: 2px solid var(--color-purple-sage);
  box-shadow: 0 4px 8px rgba(113, 73, 151, 0.2);
  font-size: 0.8rem;
  
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
    font-size: 0.75rem;
    line-height: 1.4;
  }
}

/* Override any potential Slidev defaults */
.two-cols-custom .slidev-layout {
  background: inherit !important;
}

/* Special styling for v-clicks */
.two-cols-custom .v-click-hidden {
  opacity: 0.3;
  transition: opacity 0.3s ease;
}

.two-cols-custom .v-click-shown {
  opacity: 1;
  transition: opacity 0.3s ease;
}

/* Compact spacing variant */
.two-cols-custom.compact-spacing h1 {
  @apply text-lg mb-2 !important;
}

.two-cols-custom.compact-spacing h2 {
  @apply text-base mb-2 !important;
}

.two-cols-custom.compact-spacing p {
  @apply mb-2 text-sm !important;
}

.two-cols-custom.compact-spacing strong {
  @apply text-sm !important;
}

.two-cols-custom.compact-spacing blockquote {
  @apply my-2 px-3 py-2 text-sm !important;
  border-left: 3px solid #10b981;
  background: #f0fdf4;
}

.two-cols-custom.compact-spacing blockquote p {
  @apply mb-0 !important;
}

.two-cols-custom.compact-spacing .v-clicks > * {
  @apply mb-2 !important;
}

/* Span Title Feature */
.two-cols-custom.span-title {
  @apply flex flex-col;
}

.two-cols-custom.span-title .title-area {
  @apply mb-4 px-6 pt-4;
  
  h1 {
    @apply text-3xl font-bold text-center mb-2;
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

.two-cols-custom.span-title .content-grid {
  @apply flex-1;
}

.two-cols-custom.span-title .content-area {
  @apply pb-4;
}
</style>