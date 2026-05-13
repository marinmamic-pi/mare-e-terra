---
title: "Subscribe — Mare e Terra"
date: 2026-05-13
draft: false
---

<div style="display:none;">Mare e Terra — Subscribe page</div>

<section class="hero" style="padding:5rem 1.5rem 4rem;text-align:center;background:linear-gradient(135deg,#FFF8EC 0%,#F0F0E8 100%);border-bottom:3px solid #8FBC8F;">
  <div class="hero-content" style="max-width:720px;margin:0 auto;">
    <p class="hero-brand" style="font-family:'Playfair Display',Georgia,serif;font-size:0.875rem;color:#8FBC8F;letter-spacing:4px;text-transform:uppercase;margin-bottom:1.5rem;">Mare e Terra</p>
    <h1 style="font-family:'Playfair Display',Georgia,serif;font-size:2.5rem;font-weight:700;color:#5C4033;margin-bottom:1rem;line-height:1.25;">Join the table</h1>
    <p class="subtitle" style="font-size:1.125rem;color:#2C5F7C;font-style:italic;margin-bottom:0.5rem;">Weekly stories from the Adriatic</p>
    <p class="description" style="font-size:1rem;color:#6B6B6B;max-width:580px;margin:0 auto 2rem;line-height:1.8;">
      Seasonal recipes, cultural history, and the rhythms of life where olive groves meet the sea.
      Delivered to your inbox every week. No spam, no tourist traps — just the real Mediterranean table.
    </p>
    <form id="subscribe-form" class="signup-form"
          action="{{ .Site.Params.listmonkUrl }}/subscription/form"
          method="POST" target="listmonk-frame"
          style="background:#FFFFFF;padding:0.7rem;border-radius:8px;display:inline-flex;gap:0.5rem;box-shadow:0 2px 12px rgba(92,64,51,0.08);flex-wrap:wrap;justify-content:center;max-width:500px;margin:0 auto;">
      <input type="hidden" name="l" value="{{ .Site.Params.listmonkListUuid }}">
      <input type="email" name="email" placeholder="Your email address" required
             style="padding:0.75rem 1rem;border:1px solid #D4C5A9;border-radius:6px;font-family:'Lora',Georgia,serif;font-size:0.95rem;color:#2C2C2C;background:#FFF8EC;flex:1 1 200px;min-width:200px;">
      <input type="text" name="name" placeholder="Your name (optional)"
             style="padding:0.75rem 1rem;border:1px solid #D4C5A9;border-radius:6px;font-family:'Lora',Georgia,serif;font-size:0.95rem;color:#2C2C2C;background:#FFF8EC;flex:1 1 180px;min-width:160px;">
      <button type="submit"
              style="padding:0.75rem 1.5rem;background:#BF4B28;color:#FFFFFF;border:none;border-radius:6px;font-family:'Playfair Display',Georgia,serif;font-size:1rem;font-weight:700;cursor:pointer;white-space:nowrap;transition:background 0.2s;">
        Subscribe Free →
      </button>
    </form>
    <iframe name="listmonk-frame" style="display:none;"></iframe>
    <div id="form-success" style="display:none;margin-top:1rem;color:#7A9A5A;font-weight:600;">✓ You're subscribed! Check your inbox.</div>
    <div id="form-error" style="display:none;margin-top:1rem;color:#BF4B28;">Something went wrong. Please try again.</div>
  </div>
</section>

<section style="padding:3rem 1.5rem;background:#FFFFFF;">
  <div style="max-width:720px;margin:0 auto;">
    <h2 style="font-family:'Playfair Display',Georgia,serif;font-size:1.5rem;font-weight:700;color:#5C4033;margin-bottom:1.5rem;text-align:center;">What you'll get, every week</h2>
    <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));gap:1.5rem;">
      <div style="background:#FFF8EC;padding:1.5rem;border-radius:8px;text-align:center;">
        <div style="font-size:2rem;margin-bottom:0.75rem;">🌱</div>
        <h3 style="font-family:'Playfair Display',Georgia,serif;font-size:1.1rem;font-weight:700;color:#5C4033;margin-bottom:0.5rem;">Seasonal Recipes</h3>
        <p style="font-size:0.9rem;color:#6B6B6B;line-height:1.6;">What's actually in season right now, from olive groves and coastal markets across the basin.</p>
      </div>
      <div style="background:#FFF8EC;padding:1.5rem;border-radius:8px;text-align:center;">
        <div style="font-size:2rem;margin-bottom:0.75rem;">📖</div>
        <h3 style="font-family:'Playfair Display',Georgia,serif;font-size:1.1rem;font-weight:700;color:#5C4033;margin-bottom:0.5rem;">Cultural Stories</h3>
        <p style="font-size:0.9rem;color:#6B6B6B;line-height:1.6;">The history and tradition behind each dish — because every recipe has a story.</p>
      </div>
      <div style="background:#FFF8EC;padding:1.5rem;border-radius:8px;text-align:center;">
        <div style="font-size:2rem;margin-bottom:0.75rem;">🌿</div>
        <h3 style="font-family:'Playfair Display',Georgia,serif;font-size:1.1rem;font-weight:700;color:#5C4033;margin-bottom:0.5rem;">Olive &amp; Stone</h3>
        <p style="font-size:0.9rem;color:#6B6B6B;line-height:1.6;">Curated picks: one book, one film, one place — all Mediterranean, all real.</p>
      </div>
    </div>
  </div>
</section>

<section style="padding:3rem 1.5rem;background:#FFF8EC;">
  <div style="max-width:720px;margin:0 auto;text-align:center;">
    <h2 style="font-family:'Playfair Display',Georgia,serif;font-size:1.5rem;font-weight:700;color:#5C4033;margin-bottom:1rem;">Already a subscriber?</h2>
    <p style="color:#6B6B6B;margin-bottom:1.5rem;line-height:1.8;">
      Start with our latest issue, or browse the recipe archive.
    </p>
    <p>
      <a href="/issue/1/" style="display:inline-block;padding:0.75rem 1.5rem;background:#2C5F7C;color:#FFFFFF;text-decoration:none;font-family:'Playfair Display',Georgia,serif;font-size:1rem;font-weight:700;border-radius:6px;margin-right:0.75rem;">Read Issue #1 →</a>
      <a href="/recipes/" style="display:inline-block;padding:0.75rem 1.5rem;background:#7A9A5A;color:#FFFFFF;text-decoration:none;font-family:'Playfair Display',Georgia,serif;font-size:1rem;font-weight:700;border-radius:6px;">Recipe Archive</a>
    </p>
  </div>
</section>
