    rules_version = '2';
    service firebase.storage {
      match /b/{bucket}/o {
        match /{allPaths=**} {
          allow read; // Anyone can view
          allow write: if request.auth != null; // Only logged in users can upload
          // OR for development: allow write: if true; 
        }
      }
    }
    