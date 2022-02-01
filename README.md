# Simatic.AX.Collections

## Version
Version 0.2.0 see [change log](changelog.md)

This collection library contains some useful classes for list handling of types of IListItem. The Advantage of the concept is, that you don't need to use arrays with fixed size and you can mix the types as long as they're of type IListItem.

> Important: By inserting, adding, writing some items NO copy of the object will be created.

## Install this package

Enter:
```cli
apax add @simatic-ax/collections
```

## Namespace 

```
Simatic.Ax.Collections;
```

> to install this package you need to login into the GitHub registry. You'll find more information [here](https://github.com/simatic-ax/.github/blob/main/doc/personalaccesstoken.md)

## Linked List

### Add() : IListItem Method

Add a new object IListItem to the end of the list

|Parameter|Type|Description|
|-|-|-|
|Return Value   |IListItem |Reference to the inserted item  |
|item           |IListItem |Item to be inserted             |
|join           |BOOL      |Create a ring list. First and last element will be linked. It works only once with the latest item which is added.

```iec-st
METHOD PUBLIC FINAL Add : IListItem
    VAR_INPUT
        item : IListItem;
        join : BOOL := FALSE;
    END_VAR
END_METHOD
```

### Remove() : BOOL Method

Remove a IListItem from the list.

```iec-st
METHOD PUBLIC Remove : BOOL
    VAR_INPUT
        item : IListItem;
    END_VAR
END_METHOD
```

|Parameter|Type|Description|
|-|-|-|
|Return Value   |Bool       |Removing item was successful    |
|item           |IListItem  |Reference to item to be removed |

## FIFO

### Enqueue(item : IListItem) : IListItem Method

```iec-st        
METHOD Enqueue : IListItem
    VAR_INPUT
        item : IListItem;
    END_VAR
END_METHOD
```

|Parameter|Type|Description|
|-|-|-|
|Return Value   |IListItem |Reference to the enqueued item  |
|item           |IListItem |Item to be inserted             |

### Dequeue() : IListItem Method

```iec-st
METHOD Dequeue : IListItem
END_METHOD
```

|Parameter|Type|Description|
|-|-|-|
|Return Value   | IListItem       | Return and remove the oldest element in the list  |

### Count() INT;

```iec-st
    METHOD PUBLIC Count : INT
    END_METHOD
```

|Parameter|Type|Description|
|-|-|-|
|Return Value   |INT        |Count of elements in the FIFO   |

## LIFO

### Push(item : IListItem) : IListItem Method

```iec-st        
METHOD Push : IListItem
    VAR_INPUT
        item : IListItem;
    END_VAR
END_METHOD
```

|Parameter|Type|Description|
|-|-|-|
|Return Value   |IListItem |Reference to the pushed item  |
|item           |IListItem |Item to be inserted             |

### Pop() : IListItem Method

```iec-st
METHOD Pop : IListItem
END_METHOD
```

|Parameter|Type|Description|
|-|-|-|
|Return Value   | IListItem       | Return and remove the newest element in the list  |

### Top() : IListItem Method

```iec-st
METHOD Pop : IListItem
END_METHOD
```

|Parameter|Type|Description|
|-|-|-|
|Return Value   | IListItem       | Return the newest element in the list (without removing) |

### Count() INT;

```iec-st
    METHOD PUBLIC Count : INT
    END_METHOD
```

|Parameter|Type|Description|
|-|-|-|
|Return Value   |INT        |Count of elements in the LIFO   |

## Contribution

Thanks for your interest in contributing. Anybody is free to report bugs, unclear documentation, and other problems regarding this repository in the Issues section or, even better, is free to propose any changes to this repository using Merge Requests.

## License and Legal information

Please read the [Legal information](LICENSE.md)
