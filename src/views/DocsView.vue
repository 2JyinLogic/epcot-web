<template>
  <div class="docs-redirect">
    <div class="loading-spinner"></div>
    <p>Opening documentation page...</p>
  </div>
</template>

<script>
import { getDocsUrl } from '../config/env'

export default {
  name: "DocsView",
  mounted() {
    // Open documentation page in new window
    const docsUrl = getDocsUrl();
    window.open(docsUrl, '_blank');
    // Return to previous page or home
    this.$router.push('/');
  }
};
</script>

<style scoped>
.docs-redirect {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
  font-size: 1.2rem;
  color: #666;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

.loading-spinner {
  width: 40px;
  height: 40px;
  border: 4px solid #f3f3f3;
  border-top: 4px solid #3498db;
  border-radius: 50%;
  animation: spin 1s linear infinite;
  margin-bottom: 1rem;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
