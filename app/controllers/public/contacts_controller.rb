class Public::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  # 確認画面を作成する場合の記述
  # newアクションから入力内容を受け取り、
  # 送信ボタン→createアクションを実行
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  # 入力内容に誤りがあった場合、
  # backアクションを定義することで可能となる
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  # 実際に送信するアクション
  # ここで初めて入力内容を保存
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      NotificationMailer.contact_created(@contact).deliver_now
      redirect_to done_path
    else
      render :new
    end
  end

  def done
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :name, :telephone_number, :subject, :message)
  end
end
