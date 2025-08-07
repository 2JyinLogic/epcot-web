<template>
  <div class="code-block">
    <div class="code-title">{{ title }}</div>
    <div class="code-box">
      <el-button class="copy-btn" type="primary" size="small" @click="copyCode">COPY</el-button>
      <pre><code>{{ code }}</code></pre>
    </div>
  </div>
</template>

<script setup lang="ts">
const { title, code } = defineProps<{
  title: string
  code: string
}>()

const copyCode = async () => {
  await navigator.clipboard.writeText(code)
}
</script>

<style scoped>
.code-block {
  margin-bottom: 0; /* No bottom margin */
  border-bottom: 1px solid #ddd;
}

.code-title {
  background: #e6e8ec;
  padding: 0.6rem 1rem;
  font-weight: bold;
  font-size: 0.75rem;
  color: #333;
}

.code-box {
  position: relative;
  background: #fff;
  padding: 1rem;
  font-size: 0.55rem;
  overflow-x: auto;
}

/* COPY button floats to top right corner */
.copy-btn {
  position: absolute;
  right: 0.55rem !important;
  z-index: 1;
}
.el-tabs__content {
  padding: 0 !important;
  margin: 0 !important;
}
.el-tab-pane {
  padding: 0 !important;
  margin: 0 !important;
}
</style>
