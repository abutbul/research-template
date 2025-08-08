---
transition: fade-out
layout: default
title: Research Presentation Template
---

<style>
  .title-animation {
    animation: pulse 3s infinite;
    display: inline-block;
  }

  @keyframes pulse {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.05); text-shadow: 0 0 15px rgba(255, 255, 255, 0.8); }
  }

  .subtitle-animation {
    animation: slideIn 1.5s ease-out;
  }

  @keyframes slideIn {
    0% { transform: translateY(20px); opacity: 0; }
    100% { transform: translateY(0); opacity: 1; }
  }
</style>

# Research Title
## <span class="subtitle-animation">Subtitle or Context</span>

*Author Name(s)*

<div class="pt-12">
  <span @click="$slidev.nav.next" class="px-2 py-1 rounded cursor-pointer" hover="bg-white bg-opacity-10">
    Press Space for Next Slide <carbon:arrow-right class="inline"/>
  </span>
</div>

<div class="abs-br m-6 flex gap-2">
  <a href="https://github.com/yourusername" target="_blank" alt="GitHub"
    class="text-xl slidev-icon-btn opacity-50 !border-none !hover:text-white">
    <carbon-logo-github />
  </a>
</div>