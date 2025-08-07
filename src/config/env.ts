// Environment configuration
export const getBaseUrl = (): string => {
  // In development
  if (import.meta.env.DEV) {
    return '/';
  }
  
  // In production, use the BASE_URL from Vite config
  return import.meta.env.BASE_URL || '/';
};

export const getDocsUrl = (): string => {
  const baseUrl = getBaseUrl();
  return `${baseUrl}docs/index.html`;
};

export const getInstallDocsUrl = (): string => {
  const baseUrl = getBaseUrl();
  return `${baseUrl}docs/install/index.html`;
};

export const getTutorialDocsUrl = (): string => {
  const baseUrl = getBaseUrl();
  return `${baseUrl}docs/tutorial/index.html`;
}; 