<template>
  <el-header class="navbar">
    <div class="left">
      <router-link to="/" class="logo">EPCOT</router-link>
      <router-link to="/model">Models</router-link>
      <router-link to="/about">About</router-link>
      <router-link to="/docs">Docs</router-link>
    </div>
    <div class="right">
  <a href="https://biorxiv.org/epcot-paper" target="_blank">
    <el-icon><Document /></el-icon>
    <span>Paper</span>
  </a>
  <a href="https://github.com/epcot-project/epcot" target="_blank">
    <svg
      class="github-icon"
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 24 24"
      width="1em"
      height="1em"
      fill="currentColor"
    >
      <path
        d="M12 0.5C5.373 0.5 0 5.873 0 12.5C0 17.963 3.438 22.627 8.207 24.317C8.805 24.417 9.025 24.05 9.025 23.727C9.025 23.434 9.014 22.678 9.009 21.728C5.672 22.405 4.967 20.292 4.967 20.292C4.422 18.936 3.633 18.575 3.633 18.575C2.546 17.848 3.718 17.863 3.718 17.863C4.922 17.954 5.554 19.097 5.554 19.097C6.625 20.937 8.445 20.427 9.137 20.136C9.232 19.372 9.534 18.837 9.872 18.532C7.194 18.222 4.392 17.102 4.392 12.222C4.392 10.831 4.885 9.73 5.693 8.875C5.563 8.567 5.122 7.24 5.803 5.432C5.803 5.432 6.826 5.097 9.003 6.588C9.984 6.307 11.033 6.167 12.083 6.162C13.133 6.167 14.183 6.307 15.167 6.588C17.341 5.097 18.361 5.432 18.361 5.432C19.044 7.24 18.6 8.567 18.472 8.875C19.283 9.73 19.772 10.831 19.772 12.222C19.772 17.112 16.963 18.217 14.277 18.522C14.736 18.927 15.144 19.729 15.144 21.012C15.144 22.782 15.126 23.944 15.126 23.727C15.126 24.05 15.343 24.421 15.947 24.316C20.72 22.625 24.16 17.962 24.16 12.5C24.16 5.873 18.788 0.5 12 0.5Z"
      />
    </svg>
    <span>Repository</span>
  </a>
</div>

  </el-header>
</template>

<script setup lang="ts">
import { Document } from '@element-plus/icons-vue'
</script>


<style scoped>
.navbar {
  width: 100vw;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 2rem;
  background-color: #276a8d; /* 深蓝背景 */
  border-bottom: 1px solid #1e5a7a;
  font-size: 16px;
  height: 64px;
  box-sizing: border-box;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.15);
  position: relative;
  left: 0;
  top: 0;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

.left, .right {
  display: flex;
  gap: 2rem;
  align-items: center;
}

.logo {
  font-weight: bold;
  font-size: 30px;
  color: #ffffff;
}

a, router-link {
  text-decoration: none;
  font-size: 18px;
  color: #ffffff;
  transition: color 0.3s ease;
}

a:hover, .logo:hover, router-link:hover {
  color: #4ea3ff; /* 浅蓝 hover 色 */
}

.right a {
  display: inline-flex;
  align-items: center;
  gap: 0.4rem;
}

.github-icon {
  width: 1em;
  height: 1em;
  fill: currentColor;
}

</style>
