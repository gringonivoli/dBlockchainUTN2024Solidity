// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract TodoList {

    // tasks (texto, ToDo/Doing/Done)
    enum TaskStatus {
        ToDo,
        Doing,
        Done
    }

    struct Task {
        string text;
        TaskStatus status;
    }

    mapping(address => Task[]) tasks;
    mapping(address => mapping(string => Task[])) tasks2;
    // 0x1.... Task[{text: jjj, status: 22323}, {}] 
    // 0x2.... Task[{}]

    function create(string memory text) public {
        tasks[msg.sender].push(Task(text, TaskStatus.ToDo));
        // tasks.push(Task(text, TaskStatus.ToDo));
    }

    function taskComplete(uint index) public {
        tasks[msg.sender][index].status = TaskStatus.Done;
        // tasks[index].status = TaskStatus.Done;
    }

    function taskInProgress(uint index) public {
        tasks[msg.sender][index].status = TaskStatus.Doing;
    }

    function taskToDo(uint index) public {
        tasks[msg.sender][index].status = TaskStatus.ToDo;
    }
}