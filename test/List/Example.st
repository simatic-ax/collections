USING AxUnit.Assert;

NAMESPACE Simatic.Ax.Collections

    // Example of a concrete customized ListItem
    CLASS MinMaxItem
        EXTENDS ListItem
        VAR PUBLIC
            Min : INT;
            Max : INT;
        END_VAR
    END_CLASS

    // Example of a concrete customized ListItem
    CLASS RangeItem
        EXTENDS ListItem
        VAR PUBLIC
            FromValue : INT;
            ToValue : INT;
        END_VAR
    END_CLASS

    {TestFixture}
    CLASS Example
        VAR PRIVATE
            _list : LinkedList;
            _i1 : MinMaxItem := (Min := 1, Max := 100);
            _i2 : MinMaxItem := (Min := 2, Max := 200);
            _i3 : RangeItem := (FromValue := 3, ToValue := 300); // declare a wrong, another list item which is not of type MinMaxItem
            _item : REF_TO MinMaxItem;
        END_VAR
        // Add 2 elements of MinMaxItem and one wrong element RangeItem to the list. 
        // By reading the tail, the assignment attempt (?=) fails, because RangeItem can not be converted to MinMaxItem

        {Test}
        METHOD PUBLIC Test_Add_3_Elements_To_Queue_And_Get_Values_from_first_item
            _list.Add(item := _i1); // add i1 to head
            _list.Add(item := _i2);
            _list.Add(item := _i3); // add _i3, a wrong IListItem to the list (Tail)
            _item ?= _list.Tail(); // assignment attempt (?=) --> It's NULL if not of type MinMaxItem
            Equal(_item <> NULL, TRUE);
            IF (_item <> NULL) THEN
                Equal(_item^.Min, 1);
                Equal(_item^.Max, 100);
            END_IF;
            _item ?= _list.Head(); // assignment attempt (?=) --> It's NULL if not of type MinMaxItem
            Equal(_item = NULL, TRUE);
            IF (_item <> NULL) THEN
                NotEqual(_item^.Min, 3);
                NotEqual(_item^.Max, 300);
            END_IF;
            Equal(expected := 3, actual := _list.Count());
        END_METHOD
    END_CLASS

END_NAMESPACE