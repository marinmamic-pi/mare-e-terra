// Mare e Terra lightweight pageview tracker
// Fallback for environments where GoatCounter isn't available
(function() {
  var t = { p: window.location.pathname, r: document.referrer || '' };
  console.log('[Mare e Terra] Pageview:', t.p);
  // Future: POST to analytics endpoint
})();
