% Accuracy.m : Srinivas Bavisetti,Utphala Puttananjammagari
% Description: function to claculate the accuracy of the given result table

function result = Accuracy(output_table)
    
    p_val = output_table.Predicted_Values;
    e_val = output_table.Expected_Values;
    
    acc =0;
    for i = 1 : size(p_val,1)
        if(p_val(i) == e_val(i))
            acc =acc+1;
        end
    end
    acc = acc/size(p_val,1);
    result =acc;
end
