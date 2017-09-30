chrome.storage.sync.get(val => {
  const path = val.url;
  // setTimeout(() => {
  chrome.tabs.getSelected(null, tab => {
    $.post(path, {item: {title: tab.title, url: tab.url}}, () => {
      $("#root #preloader").remove();
      $("#root").append(`
        <div class="message">
          <p>posted:</p>
          <p>${tab.title}</p>
          <p>${tab.url}</p>
        </div>
      `);
    });
  });
  // }, 300);
});
