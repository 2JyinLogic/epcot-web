<template>
  <footer class="footer">
    <div class="footer-content">
      <div class="footer-section">
        <h3>ABOUT EPCOT</h3>
        <p>
          EPCOT is a unified deep learning framework for genomics across cells, tissues, and species.
        </p>
      </div>

      <div class="footer-section">
        <h3>USEFUL LINKS</h3>
        <ul>
          <li><a href="https://biorxiv.org/epcot-paper" target="_blank">Paper</a></li>
          <li><a href="https://github.com/epcot-project/epcot" target="_blank">Repository</a></li>
          <li><router-link to="/docs">Documentation</router-link></li>
        </ul>
      </div>

      <div class="footer-section">
        <h3>Like the project?</h3>
        <a
          class="tweet-btn"
          href="https://twitter.com/intent/tweet?text=Check%20out%20EPCOT%20for%20genomics!&url=https://epcot-project.github.io"
          target="_blank"
        >
          CONTACT US!
        </a>
      </div>
    </div>

    <div class="footer-bottom">
      © 2025 The EPCOT Team. Developed by
      <a href="https://github.com/epcot-project" target="_blank">EPCOT Team</a>
    </div>
  </footer>
</template>

<script setup lang="ts">
// 没有逻辑代码可省略 script，也可以保留这个空 script
</script>

<style scoped>
.footer {
  background-color: #0e3a5f;
  color: #ffffff;
  padding: 3rem 2rem 2rem;
  font-size: 15px;
  overflow-x: auto; /* 防止超出时挤压 */
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

.footer-content {
  display: flex;
  flex-wrap: nowrap; /* ✅ 禁止换行 */
  justify-content: center;
  max-width: 1200px;
  margin: 0 auto;
  width: 100%;
  text-align: left;
  gap: 4rem;
}

.footer-section {
  flex: 0 1 auto;
  box-sizing: border-box;
  padding: 0 2rem;
  text-align: left;
}

.footer-section h3 {
  font-size: 18px;
  margin-bottom: 1rem;
  font-weight: 700;
  color: #ffffff;
}

.footer-section p,
.footer-section li {
  font-size: 16px;
  line-height: 1.7;
  color: #ffffff;
  max-width: 450px;
}

.footer-section ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.footer-section a {
  color: #ffffff;
  text-decoration: none;
  font-size: 16px;
}

.footer-section a:hover {
  text-decoration: underline;
}

.tweet-btn {
  display: inline-block;
  padding: 0.6rem 1.2rem;
  background-color: #4ea3ff;
  color: #ffffff;
  border-radius: 4px;
  font-weight: bold;
  font-size: 15px;
  text-align: center;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  transition: background 0.3s ease;
  margin-top: 0.8rem;
}

.tweet-btn:hover {
  background-color: #2b82db;
  transform: translateY(-1px);
  box-shadow: 0 4px 8px rgba(78, 163, 255, 0.3);
}

.footer-bottom {
  text-align: center;
  margin-top: 2rem;
  padding-top: 1rem;
  border-top: 1px solid rgba(255, 255, 255, 0.2);
  font-size: 13px;
  color: #ffffff;
}

.footer-bottom a {
  color: #ffffff;
  font-weight: 600;
  text-decoration: none;
}

</style>
