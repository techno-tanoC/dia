function init() {
  chrome.storage.sync.get(val => {
    $("#url").val(val.url);
  });
}

function save() {
  chrome.storage.sync.set({url: $("#url").val()});
}

init();
$("#save-button").click(save);
