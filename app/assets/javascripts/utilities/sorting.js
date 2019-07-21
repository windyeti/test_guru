document.addEventListener('turbolinks:load', function() {
  var titles = document.querySelectorAll('.head_control');
    titles.forEach(function(title) {
      title.addEventListener('click', sortRowByTitle)
  })
});

function sortRowByTitle() {

  var table = find_table(this);

  var arrRows = [].slice.call(table.rows);
  var tableHeader = arrRows.shift();

  var arrow_up = this.querySelector('.octicon-arrow-small-up');
  var arrow_down = this.querySelector('.octicon-arrow-small-down');

  var rowsNewOrder = [];

  if (arrow_down.classList.contains('hide')) {
    rowsNewOrder = sortRow(arrRows, 'ASC');
    arrow_down.classList.remove('hide');
    arrow_up.classList.add('hide');
  } else {
    rowsNewOrder = sortRow(arrRows, 'DESC');
    arrow_up.classList.toggle('hide');
    arrow_down.classList.toggle('hide');
  }

  var newTable = document.createElement('table');
  newTable.classList.add('table', 'table-striped', 'table-borderless', 'table-hover');
  newTable.appendChild(tableHeader);

  rowsNewOrder.forEach(function(row) {
    newTable.appendChild(row)
  });

  table.parentNode.replaceChild(newTable, table);

  function sortRow(rows, order) {
    var switcher;
    if (order === 'ASC') switcher = 1;
    if (order === 'DESC')  switcher = -1;

    return rows.sort(compareRow);

    function compareRow(a, b) {
      if (a.cells[1].textContent > b.cells[1].textContent) return 1 * switcher;
      if (a.cells[1].textContent < b.cells[1].textContent) return -1 * switcher;
    }
  }

  function find_table(elem) {
    var parent = elem.parentNode;
    while(parent.tagName != 'HTML') {
      if (parent.tagName === 'TABLE') return parent;
      parent = parent.parentNode;
    }
    return null
  }
}

