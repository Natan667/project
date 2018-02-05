class NotificationsController < ApplicationController
 def destroy
    @notifications = Notification.all
    @notifications.destroy_all
    redirect_to request.referrer, flash: { success: 'Notifications cleared done'}
  end
end
