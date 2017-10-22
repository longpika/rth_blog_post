ActiveAdmin.register BlogPost do
  actions :all, :except => [:edit, :new]
  permit_params do
    permitted = [:title, :content, :user_id]
    permitted
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :content, as: :quill_editor
      f.input :account_id, :input_html => { :value => current_user.id }, as: :hidden
    end

    f.actions
  end
end
