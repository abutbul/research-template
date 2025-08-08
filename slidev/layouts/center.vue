<script setup>
import { computed } from 'vue'

const props = defineProps({
  class: String,
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
</script>

<template>
  <div
    class="slidev-layout center-custom"
    :class="[
      themeClasses,
      props.class
    ]"
  >
    <div class="flex items-center justify-center h-full">
      <div class="content-area center-content">
        <slot />
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

.center-custom {
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

.center-custom .content-area {
  @apply p-8 rounded-lg text-center mx-auto;
  width: 80vw; /* Force consistent width */
  max-width: 4xl;
  min-width: 60vw; /* Ensure minimum width */
  
  .theme-light & {
    background: rgba(195, 178, 211, 0.4) !important;
    border: 2px solid var(--color-purple-sage);
    box-shadow: 0 8px 16px rgba(113, 73, 151, 0.15);
  }
  
  .theme-dark & {
    background: rgba(166, 140, 189, 0.25) !important;
    border: 2px solid var(--color-purple-sage);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
  }
  
  .theme-gradient & {
    background: rgba(255, 255, 255, 0.2) !important;
    border: 2px solid rgba(255, 255, 255, 0.4);
    backdrop-filter: blur(15px);
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
  }
}

.center-custom h1 {
  @apply text-5xl font-bold mb-8;
  color: var(--color-royal-purple);
  
  .theme-dark & {
    color: var(--color-lilac-haze);
  }
  
  .theme-gradient & {
    color: var(--color-lavender-mist);
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
  }
}

.center-custom h2 {
  @apply text-3xl font-semibold mb-6;
  color: var(--color-purple-sage);
  
  .theme-dark & {
    color: var(--color-lavender-mist);
  }
  
  .theme-gradient & {
    color: var(--color-lavender-mist);
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.4);
  }
}

.center-custom h3 {
  @apply text-2xl font-medium mb-5;
  color: var(--color-royal-purple);
  
  .theme-dark & {
    color: var(--color-lilac-haze);
  }
  
  .theme-gradient & {
    color: var(--color-lavender-mist);
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
  }
}

.center-custom p {
  @apply mb-6 text-lg leading-relaxed;
  
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

.center-custom ul, 
.center-custom ol {
  @apply mb-6 text-left max-w-2xl mx-auto;
  
  li {
    @apply mb-3 text-lg leading-relaxed;
    
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

.center-custom code {
  @apply px-3 py-2 rounded text-base;
  background: white !important;
  color: #333 !important;
  border: 1px solid #ddd;
  font-family: 'Fira Code', 'Monaco', 'Cascadia Code', 'Roboto Mono', monospace;
}

.center-custom pre {
  @apply mb-6 p-6 rounded-lg overflow-x-auto text-left max-w-3xl mx-auto;
  background: white !important;
  border: 2px solid var(--color-purple-sage);
  box-shadow: 0 6px 12px rgba(113, 73, 151, 0.2);
  
  .theme-dark & {
    border-color: var(--color-lilac-haze);
  }
  
  .theme-gradient & {
    border-color: rgba(255, 255, 255, 0.6);
    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.3);
  }
  
  code {
    @apply p-0;
    background: transparent !important;
    border: none;
    font-size: 0.9rem;
    line-height: 1.5;
  }
}

.center-custom blockquote {
  @apply border-l-4 pl-6 py-4 mb-6 italic text-xl max-w-2xl mx-auto text-left;
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

/* Override any potential Slidev defaults */
.center-custom .slidev-layout {
  background: inherit !important;
}

/* Special styling for v-clicks */
.center-custom .v-click-hidden {
  opacity: 0.3;
  transition: opacity 0.3s ease;
}

.center-custom .v-click-shown {
  opacity: 1;
  transition: opacity 0.3s ease;
}

/* Enhanced center-specific elements */
.center-custom .hero-text {
  @apply text-6xl font-extrabold mb-6;
  background: linear-gradient(45deg, var(--color-royal-purple), var(--color-purple-sage));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  
  .theme-dark & {
    background: linear-gradient(45deg, var(--color-lilac-haze), var(--color-lavender-mist));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }
  
  .theme-gradient & {
    color: var(--color-lavender-mist);
    text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.6);
    background: none;
    -webkit-text-fill-color: initial;
  }
}

.center-custom .subtitle {
  @apply text-2xl font-light mb-8 opacity-80;
}

.center-custom .cta-button {
  @apply inline-block px-8 py-4 rounded-lg font-semibold text-lg transition-all duration-300;
  background: var(--color-royal-purple);
  color: var(--color-lavender-mist);
  
  &:hover {
    background: var(--color-deep-violet);
    transform: translateY(-2px);
    box-shadow: 0 8px 16px rgba(113, 73, 151, 0.3);
  }
  
  .theme-dark & {
    background: var(--color-lilac-haze);
    color: var(--color-deep-violet);
    
    &:hover {
      background: var(--color-lavender-mist);
    }
  }
  
  .theme-gradient & {
    background: rgba(255, 255, 255, 0.2);
    border: 2px solid rgba(255, 255, 255, 0.4);
    backdrop-filter: blur(10px);
    
    &:hover {
      background: rgba(255, 255, 255, 0.3);
    }
  }
}
</style>