ActiveAdmin.register Poll do

  form do |f|
    f.inputs do
      f.input :featured
      f.input :enabled
    end
    f.actions
  end
end
