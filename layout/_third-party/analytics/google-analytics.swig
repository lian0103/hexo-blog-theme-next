<script type="module">
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyCK_6P0CCd5NGNAFls-55ULfkAgkQhYzWU",
    authDomain: "hexo-blog-2de2a.firebaseapp.com",
    projectId: "hexo-blog-2de2a",
    storageBucket: "hexo-blog-2de2a.appspot.com",
    messagingSenderId: "886252658662",
    appId: "1:886252658662:web:3c3d8e7ba61b083e468027",
    measurementId: "G-EZM0C0ED5Z"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
</script>

{%- if theme.google_ad_client %}
    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client={{ theme.google_ad_client }}"
     crossorigin="anonymous"></script>
{%- endif %}

{%- if theme.google_analytics.tracking_id %}
  {%- if not theme.google_analytics.only_pageview %}
    <script async src="https://www.googletagmanager.com/gtag/js?id={{ theme.google_analytics.tracking_id }}"></script>
    <script{{ pjax }}>
      if (CONFIG.hostname === location.hostname) {
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', '{{ theme.google_analytics.tracking_id }}');
      }
    </script>
  {%- endif %}
  {%- if theme.google_analytics.only_pageview %}
    <script>
      function sendPageView() {
        if (CONFIG.hostname !== location.hostname) return;
        var uid = localStorage.getItem('uid') || (Math.random() + '.' + Math.random());
        localStorage.setItem('uid', uid);
        navigator.sendBeacon('https://www.google-analytics.com/collect', new URLSearchParams({
          v  : 1,
          tid: '{{ theme.google_analytics.tracking_id }}',
          cid: uid,
          t  : 'pageview',
          dp : encodeURIComponent(location.pathname)
        }));
      }
      document.addEventListener('pjax:complete', sendPageView);
      sendPageView();
    </script>
  {%- endif %}
{%- endif %}
