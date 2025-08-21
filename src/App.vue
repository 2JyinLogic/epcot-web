<script setup lang="ts">
import { RouterView, useRoute } from 'vue-router'
import { computed } from 'vue'
import Navbar from './components/Navbar.vue'
import Footer from './components/Footer.vue'

const route = useRoute()
const isDocsPage = computed(() => route.path === '/docs')
</script>

<template>
  <div class="app-wrapper">
    <header>
      <Navbar />
    </header>

    <main class="main-content" :class="{ 'docs-page': isDocsPage }">
      <RouterView />
    </main>

    <footer>
      <Footer />
    </footer>
  </div>
</template>

<style scoped>
.app-wrapper {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  position: relative;
}

.main-content {
  flex: 1;
  padding: 0;
  background-color: transparent;
  min-height: calc(100vh - 64px - 180px);
}

.main-content.docs-page {
  padding: 0;
  background-color: transparent;
  margin: 0;
  min-height: calc(100vh - 64px - 180px);
  position: relative;
}
</style>
