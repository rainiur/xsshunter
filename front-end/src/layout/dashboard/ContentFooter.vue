<template>
  <footer class="footer">
    <div class="container-fluid">
      <ul class="nav">
        <li class="nav-item">
          <a class="nav-link">
            <i>NOTICE: Use contextually-aware output encoding. Only <b>you</b> can prevent payload fires. Or don't, I'm not an XSS cop.</i>
          </a>
        </li>
      </ul>
      <div class="copyright">
        Forked by <a href="https://twitter.com/rs_loves_bugs" target="_blank"><code>@rs_loves_bugs</code></a> from a <a href="https://twitter.com/TruffleSec" target="_blank"><code>@TruffleSec</code></a> fork from the original author: <a href="https://twitter.com/IAmMandatory" target="_blank"><code>@IAmMandatory</code></a>
      </div>
    </div>
  </footer>
</template>
<script>
  export default {
    data() {
      return {
        year: new Date().getFullYear()
      }
    }
  };
</script>
<style>
</style>
