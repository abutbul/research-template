---
layout: default
transition: fade-out
---

<style>
  .summary-parrot {
    animation: bounce 2s infinite;
    display: inline-block;
    font-size: 2rem;
  }

  @keyframes bounce {
    0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
    40% { transform: translateY(-10px); }
    60% { transform: translateY(-5px); }
  }

  .grid-container {
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-template-rows: 1fr 1fr;
    gap: 1rem;
    margin: 1rem 0;
    height: 50vh;
  }

  .highlight-box {
    background: linear-gradient(135deg, rgba(147, 51, 234, 0.1), rgba(168, 85, 247, 0.05));
    border: 1px solid rgba(147, 51, 234, 0.3);
    border-radius: 8px;
    padding: 1rem;
    display: flex;
    flex-direction: column;
    justify-content: center;
    text-align: center;
  }

  .highlight-box h2 {
    margin-bottom: 0.5rem;
    font-size: 1.3rem;
  }

  .highlight-box p {
    margin: 0;
    line-height: 1.3;
    font-size: 0.9rem;
  }

  .danger-text {
    color: var(--color-deep-violet);
    font-weight: bold;
  }

  .solution-text {
    color: var(--color-purple-sage);
    font-weight: bold;
  }
</style>

# Key Takeaways <span class="summary-parrot">🦜</span>

<div class="grid-container">
  <div class="highlight-box" v-click="1">
    <h2>🚨 Lorem Ipsum</h2>
    <p><span class="danger-text">Dolor sit amet</span></p>
  </div>
  <div class="highlight-box" v-click="2">
    <h2>🎯 Dolor Sit</h2>
    <p>Consectetur adipiscing</p>
  </div>
  <div class="highlight-box" v-click="3">
    <h2>🔍 Detection</h2>
    <p>Elit sed do</p>
  </div>
  <div class="highlight-box" v-click="4">
    <h2>🛡️ Defense</h2>
    <p><span class="solution-text">Eiusmod tempor</span></p>
  </div>
</div>

<div class="text-center mt-2" v-click="5">
<p class="text-base"><em>Lorem ipsum dolor sit amet.</em></p>
</div>
<div class="text-center mt-2" v-click="5">
<p class="text-base"><em>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</em></p>
</div>
