const toDoForm = document.querySelector("#todo-form");
const toDoInput = document.querySelector("#todo-form input");

const TODOS_KEY = "todos";
const TODOFORM_HIDDEN = "hidden";
const MODAL_OVERLAY = "modal-overlay";

let toDos = [];

toDoListBtn.addEventListener("mouseover", (e) => {
  todoSpan.classList.remove(TODOFORM_HIDDEN);
});

toDoListBtn.addEventListener("mouseout", (e) => {
  todoSpan.classList.add(TODOFORM_HIDDEN);
});

toDoListBtn.addEventListener("click", (e) => {
  toDoListModal.classList.remove(TODOFORM_HIDDEN);
  modal.classList.remove(TODOFORM_HIDDEN);
});

modal.addEventListener("click", (e) => {
  const eventTarget = e.target;
  if (eventTarget.classList.contains(MODAL_OVERLAY)) {
    toDoListModal.classList.add(TODOFORM_HIDDEN);
    modal.classList.add(TODOFORM_HIDDEN);
  }
});

function saveToDos() {
  localStorage.setItem(TODOS_KEY, JSON.stringify(toDos));
}

function deletdToDo(event) {
  const li = event.target.parentElement;
  li.remove();
  toDos = toDos.filter((toDo) => toDo.id !== parseInt(li.id));
  saveToDos();
}

const savedToDos = localStorage.getItem(TODOS_KEY);

if (savedToDos !== null) {
  const parsedToDos = JSON.parse(savedToDos);
  toDos = parsedToDos;
  parsedToDos.forEach(paintToDo);
}